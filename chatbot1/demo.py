import re

class Supportbot:
    negative_res = ("sorry", "can't", "not possible", "don't understand", "unfortunately", "won't", "don't know", "afraid", "beyond my capabilities", "no", "nope")
    exit_commands = ("exit", "quit", "bye", "goodbye", "close", "farewell", "pause", "ok", "see you later")

    def __init__(self):
        self.support_responses = {
            'acne': r'.*\s*acne.*pimple.*zits.*blemishes.*breakouts.*skin.*oily.*oil.*face',
            'hairstyle': r'.*hair.*locks.*tresses.*hairstyle.*hairfashion.*hairs.*hairstyles',
            'specs': r'.*glasses.*eyeglasses.*lenses.*frames.*optical glasses.*reading glasses.*sunglasses.*goggles.*glass.*eyeglass.*lens'
        }
        self.face_shape = None  # To store face shape if identified

    def greet(self):
        self.name = input("HELLO! WELCOME TO DAY DREAMERS CHATBOT. Can I know your name for futuristic use?\n")
        will_help = input(f"Hi {self.name}, How can I assist you today?\n")
        if will_help.lower() in self.negative_res:
            print("Alright, have a great day ahead!")
            return
        self.chat()

    def make_exit(self, reply):
        return any(command in reply.lower() for command in self.exit_commands)

    def chat(self):
        reply = input("Can I get your query? ").lower()
        while not self.make_exit(reply):
            reply = input(self.match_reply(reply))

    def ask_question(self, question, options):
        print(question)
        for idx, option in enumerate(options):
            print(f"{idx + 1}. {option}")
        while True:
            try:
                choice = int(input(f"Select an option (1-{len(options)}): ")) - 1
                if 0 <= choice < len(options):
                    return options[choice]
            except ValueError:
                pass
            print("Invalid selection. Please try again.")

    def match_reply(self, reply):
        word = reply.split()
        for intent, regex_pattern in self.support_responses.items():
            if any(re.search(i, regex_pattern) for i in word):
                return self.handle_intent(intent)
        return self.no_match_intent()

    def handle_intent(self, intent):
        switch = {
            'acne': self.ask_acne,
            'hairstyle': self.ask_hairstyle,
            'specs': self.ask_specs
        }
        return switch.get(intent, self.no_match_intent)()

    def no_match_intent(self):
        return "Sorry, I didn't quite understand that. Could you please clarify?"

    def ask_acne(self):
        # (The same as your previous implementation for skin type assessment)
        pass

    def ask_hairstyle(self):
        if self.face_shape is not None:
            return self.suggest_hairstyles(self.face_shape)
        else:
            self.get_face_shape()
            return self.suggest_hairstyles(self.face_shape)

    def get_face_shape(self):
        option = input("Do you know your face shape? (yes/no)\n").strip().lower()
        if option == "yes":
            face_shape_options = ['Oval', 'Round', 'Square', 'Heart', 'Diamond', 'Rectangle']
            self.face_shape = self.ask_question("What is your face shape?", face_shape_options)
        elif option == "no":
            print("Please upload a photo for us to determine your face shape.")
            # Here you would implement photo upload functionality
            # For simulation, we could assign a default value:
            self.face_shape = "Oval"  # Replace with actual image processing output
        else:
            print("Invalid input. Please respond with 'yes' or 'no'.")
            self.get_face_shape()

    def suggest_hairstyles(self, face_shape):
        hairstyles = {
            'Oval': ["Long layers", "Soft curls", "Blunt cut", "Side-swept bangs"],
            'Round': ["Long layers", "High-volume styles", "Angular cuts", "Side bangs"],
            'Square': ["Soft waves", "Textured layers", "Side-swept bangs", "Longer lengths"],
            'Heart': ["Soft curls", "Side-parted styles", "Long layers", "Textured bob"],
            'Diamond': ["Side-swept bangs", "Long layers", "Soft waves", "Voluminous styles"],
            'Rectangle': ["Layered styles", "Soft curls", "Side-parted styles", "Textured ends"]
        }
        response = f"Based on your face shape ({face_shape}), here are some hairstyle suggestions:\n" + "\n".join(f"- {hairstyle}" for hairstyle in hairstyles.get(face_shape, ["No recommendations available for this face shape."]))
        response += "\n\nDISCLAIMER: The suggestions provided are based on general trends and may not suit everyone's personal style. Please consult a stylist for tailored advice."
        return response

    def ask_specs(self):
        if self.face_shape is not None:
            return self.suggest_spectacle_shapes(self.face_shape)
        else:
            self.get_face_shape()
            return self.suggest_spectacle_shapes(self.face_shape)

    def suggest_spectacle_shapes(self, face_shape):
        spectacle_shapes = {
            'Oval': ["Round", "Square", "Cat-Eye", "Aviator", "Browline"],
            'Round': ["Square", "Rectangle", "Geometric", "Cat-Eye", "Browline"],
            'Square': ["Round", "Oval", "Geometric", "Browline", "Clubmaster"],
            'Heart': ["Cat-Eye", "Round", "Geometric", "Browline", "Aviator"],
            'Diamond': ["Oval", "Round", "Geometric", "Cat-Eye", "Browline"],
            'Rectangle': ["Round", "Oval", "Cat-Eye", "Geometric", "Clubmaster"]
        }
        response = f"Based on your face shape ({face_shape}), here are some spectacle shape suggestions:\n" + "\n".join(f"- {spectacle}" for spectacle in spectacle_shapes.get(face_shape, ["No recommendations available for this face shape."]))
        response += "\n\nDISCLAIMER: The suggestions provided are based on general trends and may not suit everyone's personal preferences. Please consult an eyewear specialist for tailored advice."
        return response

# Running the chatbot
if __name__ == "__main__":
    bot = Supportbot()
    bot.greet()
