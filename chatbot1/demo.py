import re
import random

class Supportbot:
    negative_res = ("sorry", "can't", "not possible", "don't understand", "unfortunately", "won't", "don't know", "afraid", "beyond my capabilities", "no", "nope")
    exit_commands = ("exit", "quit", "bye", "goodbye", "close", "farewell", "pause", "ok", "see you later")

    def __init__(self):
        self.support_responses = {
            'acne': r'.*\s*acne.*pimple.*zits.*blemishes.*breakouts.*skin.*oily.*oil.*face',
            'hairstyle': r'.*hair.*locks.*tresses.*hairstyle.*hairfashion.*hairs',
            'specs': r'.*glasses.*eyeglasses.*lenses.*frames.*optical glasses.*reading glasses.*sunglasses.*goggles.*glass.*eyeglass.*lens'
        }

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
        def determine_skin_type(responses):
            score = {
                'Dry': 0,
                'Oily': 0,
                'Combination': 0,
                'Sensitive': 0,
                'Acne Prone': 0,
                'Normal': 0
            }

            # Assess skin feel
            if responses['skin_feel'] == 1:  # Dry and tight
                score['Dry'] += 2
            elif responses['skin_feel'] == 2:  # Balanced but slightly oily
                score['Combination'] += 1
                score['Normal'] += 1
            elif responses['skin_feel'] == 3:  # Normal
                score['Normal'] += 2
            elif responses['skin_feel'] == 4:  # Oily and greasy
                score['Oily'] += 2

            # Assess skin shine
            if responses['skin_shine'] == 1:  # Dry and flaky
                score['Dry'] += 2
            elif responses['skin_shine'] == 2:  # Shiny in some areas
                score['Combination'] += 1
                score['Oily'] += 1
            elif responses['skin_shine'] == 3:  # Shiny all over
                score['Oily'] += 2
            elif responses['skin_shine'] == 4:  # Consistently matte
                score['Normal'] += 1

            # Assess acne frequency
            if responses['acne'] == 1:  # Yes, often
                score['Acne Prone'] += 2
                score['Oily'] += 1
            elif responses['acne'] == 2:  # Occasionally
                score['Acne Prone'] += 1

            # Assess sensitivity
            if responses['sensitivity'] == 1:  # Yes
                score['Sensitive'] += 2

            # Assess age
            if responses['age'] > 40:
                score['Mature'] += 2  # Could indicate mature skin type

            # Determine highest score
            skin_type = max(score, key=score.get)
            return skin_type

        def main():
            questions = {
                'skin_feel': ("How does your skin generally feel?", ["Dry and tight", "Balanced but slightly oily", "Normal", "Oily and greasy"]),
                'skin_shine': ("How does your skin appear throughout the day?", ["Dry and flaky", "Shiny in some areas", "Shiny all over", "Consistently matte"]),
                'acne': ("Do you experience frequent acne breakouts?", ["Yes, often", "Occasionally", "Never"]),
                'sensitivity': ("Is your skin prone to redness or irritation?", ["Yes", "No"]),
                'age': ("How old are you?", ["Under 20", "20-30", "30-40", "Over 40"])
            }

            responses = {}
            for key, (question, options) in questions.items():
                responses[key] = self.ask_question(question, options)

            # Convert age response to a numeric value for comparison
            if responses['age'] == "Under 20":
                responses['age'] = 19
            elif responses['age'] == "20-30":
                responses['age'] = 25
            elif responses['age'] == "30-40":
                responses['age'] = 35
            else:
                responses['age'] = 41

            skin_type = determine_skin_type(responses)
            return self.recommend_skincare(skin_type)

        return main()

    def recommend_skincare(self, skin_type):
        recommendations = {
            "Dry": [
                "Budget Range: Lacto Calamine Skin Balance (Rs.250)",
                "Mid Range: Plum Green Tea Renewed Clarity Night Gel (Rs.575)",
                "Premium Range: Clinique Moisture Surge 72 Hours Auto Replenishing Hydrator (Rs.1500-2500)"
            ],
            "Oily": [
                "Budget Range: The Derma Co. 2% Salicylic Acid Serum (Rs.499)",
                "Mid Range: The Ordinary Niacinamide 10% + Zinc 1% (Rs.550)",
                "Premium Range: La Roche-Posay Effaclar Duo (+) (Rs.1600-1800)"
            ],
            "Combination": [
                "Budget Range: Minimalist 2% Salicylic Acid Face Serum (Rs.400-500)",
                "Mid Range: Destruct Pore Control Serum (Rs.700-900)",
                "Premium Range: Bioderma Sebium Global Intensive Purifying Care (Rs.1800)"
            ],
            "Acne Prone": [
                "Budget Range: Himalaya Clarina Anti-Acne Gel (Rs.150-200)",
                "Mid Range: d'you Hustle Serum (Rs.1200-1300)",
                "Premium Range: Kaya Clinic Purifying Nourisher (Rs.1800)"
            ],
            "Mature": [
                "Budget Range: Himalaya Herbals Anti-Wrinkle Cream (Rs.200-300)",
                "Mid Range: Neutrogena Hydro Boost Gel (Rs.900-1200)",
                "Premium Range: Sunday Riley Good Genes Lactic Acid Treatment (Rs.5000+)"
            ],
            "Sensitive": [
                "Budget Range: Acnemoist Moisturizer (Rs.450)",
                "Mid Range: Minimalist 2% Salicylic Acid + LHA Serum (Rs.700-800)",
                "Premium Range: Paula's Choice C15 Super Booster (Rs.3500)"
            ],
            "Normal": [
                "Budget Range: Benzoyl Peroxide Gel Benzac AC Gel (Rs.150-250)",
                "Mid Range: Adapalene Gel (Rs.300-450)",
                "Premium Range: Aziderm 15% Acid Gel (Rs.900-1200)"
            ]
        }
        print("DISCLAIMER: The below mentioned medicines are based on our research.\n If you have any Queries contact dermatologist.\n The price may vary accordingly.")
        return f"Based on your responses, your skin type is: {skin_type}\n" + "\n".join(recommendations[skin_type])

    def ask_hairstyle(self):
        def suggest_hairstyles(face_shape):
            hairstyles = {
                'Oval': ["Long layers", "Soft curls", "Blunt cut", "Side-swept bangs"],
                'Round': ["Long layers", "High-volume styles", "Angular cuts", "Side bangs"],
                'Square': ["Soft waves", "Textured layers", "Side-swept bangs", "Longer lengths"],
                'Heart': ["Soft curls", "Side-parted styles", "Long layers", "Textured bob"],
                'Diamond': ["Side-swept bangs", "Long layers", "Soft waves", "Voluminous styles"],
                'Rectangle': ["Layered styles", "Soft curls", "Side-parted styles", "Textured ends"]
            }
            return hairstyles.get(face_shape, ["No recommendations available for this face shape."])

        face_shape_question = "What is your face shape?"
        face_shape_options = ['Oval', 'Round', 'Square', 'Heart', 'Diamond', 'Rectangle']
    
        face_shape = self.ask_question(face_shape_question, face_shape_options)
        recommended_hairstyles = suggest_hairstyles(face_shape)
        response = f"Based on your face shape ({face_shape}), here are some hairstyle suggestions:\n"
        response += "\n".join(f"- {hairstyle}" for hairstyle in recommended_hairstyles)
        return response

    def ask_specs(self):
        def suggest_spectacle_shapes(face_shape):
            spectacle_shapes = {
                'Oval': ["Round", "Square", "Cat-Eye", "Aviator", "Browline"],
                'Round': ["Square", "Rectangle", "Geometric", "Cat-Eye", "Browline"],
                'Square': ["Round", "Oval", "Geometric", "Browline", "Clubmaster"],
                'Heart': ["Cat-Eye", "Round", "Geometric", "Browline", "Aviator"],
                'Diamond': ["Oval", "Round", "Geometric", "Cat-Eye", "Browline"],
                'Rectangle': ["Round", "Oval", "Cat-Eye", "Geometric", "Clubmaster"]
            }
            return spectacle_shapes.get(face_shape, ["No recommendations available for this face shape."])

        face_shape_question = "What is your face shape?"
        face_shape_options = ['Oval', 'Round', 'Square', 'Heart', 'Diamond', 'Rectangle']
    
        face_shape = self.ask_question(face_shape_question, face_shape_options)
        recommended_spectacles = suggest_spectacle_shapes(face_shape)
        response = f"Based on your face shape ({face_shape}), here are some spectacle shape suggestions:\n"
        response += "\n".join(f"- {spectacle}" for spectacle in recommended_spectacles)
        return response

# Running the chatbot
if __name__ == "__main__":
    bot = Supportbot()
    bot.greet()
