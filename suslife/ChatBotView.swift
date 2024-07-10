import SwiftUI

struct Message: Identifiable, Equatable {
    let id = UUID()
    let text: String
    let isUserMessage: Bool

    // Implement Equatable protocol
    static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
}


struct ChatbotView: View {
    @State private var messages: [Message] = []
    @State private var inputText: String = ""
    @State private var isLoading: Bool = false

    var body: some View {
        VStack {
            GeometryReader { geometry in
                ScrollViewReader { scrollView in
                    ScrollView {
                        ForEach(messages) { message in
                            MessageView(message: message)
                        }
                        .onChange(of: messages, perform: { _ in
                            // Scroll to the bottom
                            scrollView.scrollTo(messages.last?.id, anchor: .bottom)
                        })
                    }
                    .onAppear {
                        // Scroll to the bottom initially
                        scrollView.scrollTo(messages.last?.id, anchor: .bottom)
                    }
                }
            }

            if isLoading {
                ProgressView()
            }

            MessageInputView(inputText: $inputText, sendMessage: sendMessage)
        }
        .navigationBarTitle(
            Text("Sus-y Baka")
        )
        .padding()
        .background(Color.fromRGB(red: 2, green: 89, blue: 57).edgesIgnoringSafeArea(.all))

    }

    func sendMessage() {
        guard !inputText.isEmpty else { return }

        let userMessage = inputText
        messages.append(Message(text: userMessage, isUserMessage: true))
        inputText = ""
        isLoading = true

        // Define predefined responses
        let predefinedResponses: [String: String] = [

            "hello": "Hello! How can I help you today?",
            "hi": "Hello! How can I help you today?",
            "hey": "Hello! How can I help you today?",
            "what is the purpose of this app?": "This app aims to raise awareness about important global issues and guide you in making a positive impact.",
            "what is suslife":"This app aims to raise awareness about important global issues and guide you in making a positive impact.",
            "what are the goals?": "The goals include poverty eradication, equality and justice, personal development, and more.",
            "awesome! where do i join?":"The SusLife waitlist is officially live! Sign up for early access + updates. "
            ,
            "how can I live more sustainably?": "Living sustainably involves reducing your carbon footprint, conserving resources, and supporting eco-friendly practices. You can start by reducing single-use plastics, conserving energy, and supporting sustainable products.",
            "what are some sustainable lifestyle tips?": "Some sustainable lifestyle tips include reducing waste, recycling, composting, using renewable energy sources, supporting local farmers and businesses, and choosing eco-friendly transportation options.",
            "how can I reduce my carbon footprint?": "To reduce your carbon footprint, you can decrease energy consumption, choose sustainable transportation methods, eat a more plant-based diet, and support renewable energy initiatives.",
            "why is sustainability important?": "Sustainability is crucial for preserving the environment, conserving natural resources, and ensuring a better future for generations to come. It helps mitigate climate change and protects biodiversity.",
            "what can I do to support environmental conservation?": "You can support environmental conservation by participating in local clean-up events, planting trees, reducing your consumption of resources, and advocating for policies that protect the environment.",
            "how does recycling help the environment?": "Recycling reduces the amount of waste sent to landfills, conserves natural resources like metals, paper, and plastics, and reduces greenhouse gas emissions compared to producing new materials.",
            "what are the benefits of eating locally grown food?": "Eating locally grown food reduces transportation emissions, supports local farmers, promotes seasonal eating, and can be fresher and more nutritious.",
            "how can I save water at home?": "You can save water by fixing leaks, using water-efficient fixtures and appliances, taking shorter showers, and watering your lawn and plants wisely.",
            "what is sustainable fashion?": "Sustainable fashion considers the environmental and social impacts of clothing production. It promotes ethical practices, uses eco-friendly materials, and focuses on durability and recyclability.",
            "how can I reduce plastic waste?": "To reduce plastic waste, you can use reusable bags and containers, avoid single-use plastics, choose products with minimal packaging, and support businesses that offer plastic-free alternatives.",
            "what are some eco-friendly transportation options?": "Eco-friendly transportation options include walking, biking, using public transit, carpooling, and driving electric or hybrid vehicles.",
            "how can I support wildlife conservation?": "You can support wildlife conservation by protecting natural habitats, reducing pollution, supporting wildlife sanctuaries and reserves, and advocating for wildlife protection laws.",
            "what are some benefits of solar energy?": "Solar energy is renewable, reduces greenhouse gas emissions, lowers electricity bills, promotes energy independence, and creates jobs in the renewable energy sector.",
            "how does composting help the environment?": "Composting reduces waste sent to landfills, enriches soil health, conserves water, and reduces the need for chemical fertilizers.",
            "why is biodiversity important for ecosystems?": "Biodiversity supports ecosystem stability, resilience to environmental changes, provides ecosystem services like pollination and water purification, and supports human well-being.",
            "what are sustainable building practices?": "Sustainable building practices focus on energy efficiency, using eco-friendly materials, reducing waste, incorporating renewable energy sources, and designing for durability and adaptability.",
            "how can I support sustainable tourism?": "You can support sustainable tourism by choosing eco-friendly accommodations, respecting local cultures and environments, minimizing waste and energy consumption, and supporting local businesses.",
            "what are some benefits of organic farming?": "Organic farming reduces pesticide and synthetic fertilizer use, protects soil health, promotes biodiversity, and produces healthier food without synthetic additives.",
            "what is the circular economy?": "The circular economy aims to minimize waste and maximize the use of resources by designing products for longevity, reuse, repair, and recycling.",
            "how can businesses promote sustainability?": "Businesses can promote sustainability by adopting eco-friendly practices, reducing carbon emissions, using sustainable sourcing and manufacturing processes, and engaging in corporate social responsibility.",
            "what is carbon offsetting?": "Carbon offsetting involves compensating for carbon emissions by funding projects that reduce greenhouse gases, such as reforestation or renewable energy initiatives.",
            "how can I support sustainable fisheries?": "You can support sustainable fisheries by choosing certified sustainable seafood, avoiding overfished species, supporting marine protected areas, and advocating for sustainable fishing practices.",
            "what are green buildings?": "Green buildings are designed to minimize environmental impact by using energy-efficient materials, renewable energy sources, water conservation techniques, and sustainable construction practices.",
            "what is fair trade?": "Fair trade promotes equitable trade relationships and fair wages for farmers and workers in developing countries. It ensures social and environmental sustainability in global supply chains.",
            "how does deforestation contribute to climate change?": "Deforestation releases carbon stored in trees, reduces carbon dioxide absorption, disrupts ecosystems, contributes to soil erosion, and threatens biodiversity.",
            "what are the advantages of using wind power?": "Wind power is renewable, produces no greenhouse gas emissions during operation, reduces dependence on fossil fuels, and creates jobs in the clean energy sector.",
            "how can I support renewable energy?": "You can support renewable energy by investing in solar, wind, or hydroelectric power, advocating for renewable energy policies, and reducing your own energy consumption.",
            "what is sustainable agriculture?": "Sustainable agriculture practices conserve soil health, minimize water use, reduce chemical inputs, promote biodiversity, and support local ecosystems.",
            "how can I reduce my ecological footprint?": "To reduce your ecological footprint, you can conserve energy, reduce waste, choose sustainable products, eat a plant-based diet, and support conservation efforts.",
            "what are some benefits of urban gardening?": "Urban gardening promotes local food production, reduces food miles, improves air quality, enhances community engagement, and provides green spaces in cities.",
            "how can I promote environmental education?": "You can promote environmental education by supporting schools and organizations that teach about sustainability, participating in community events, and sharing knowledge with others.",
            "what is water conservation and why is it important?": "Water conservation involves reducing water waste and promoting efficient water use. It's important to preserve freshwater resources for ecosystems and future generations.",
            "how does climate change affect wildlife?": "Climate change threatens wildlife habitats, alters ecosystems, disrupts migration patterns, increases extinction risks, and contributes to biodiversity loss.",
            "what is the Paris Agreement?": "The Paris Agreement is an international treaty that aims to limit global warming to well below 2 degrees Celsius above pre-industrial levels, with efforts to limit it to 1.5 degrees Celsius.",
            "how can I support sustainable forestry practices?": "You can support sustainable forestry by choosing certified wood and paper products, avoiding illegal timber products, promoting reforestation efforts, and advocating for forest conservation.",
            "what is greenwashing?": "Greenwashing refers to misleading claims about the environmental benefits of a product, service, or company. It involves exaggerating or misrepresenting sustainability efforts to appear more eco-friendly.",
            "what are some eco-friendly alternatives to household cleaners?": "Eco-friendly alternatives to household cleaners include vinegar, baking soda, lemon juice, and biodegradable cleaning products that are safe for the environment and human health.",
            "how can I reduce food waste at home?": "To reduce food waste, you can plan meals, store food properly, use leftovers creatively, compost organic waste, and support initiatives that rescue surplus food for those in need.",
            "what is the role of renewable energy in combating climate change?": "Renewable energy sources like solar, wind, and hydroelectric power reduce reliance on fossil fuels, lower greenhouse gas emissions, and contribute to global efforts to mitigate climate change.",
            "why is sustainable seafood important?": "Sustainable seafood practices help maintain fish populations, protect marine ecosystems, support coastal communities, and ensure seafood availability for future generations.",
            "how does overfishing impact ocean ecosystems?": "Overfishing depletes fish populations, disrupts marine food webs, threatens biodiversity, and undermines the health and resilience of ocean ecosystems.",
            "what is the 3Rs principle?": "The 3Rs principle stands for Reduce, Reuse, and Recycle. It promotes minimizing waste generation, maximizing the lifespan of products, and recycling materials to conserve resources and reduce environmental impact.",
            "how can I support environmental justice?": "You can support environmental justice by advocating for equitable access to clean air, water, and natural resources, addressing environmental racism and inequality, and supporting marginalized communities affected by environmental issues.",
            "what is sustainable transportation and why is it important?": "Sustainable transportation minimizes environmental impact by reducing emissions, promoting energy efficiency, and improving air quality. It helps combat climate change and reduce dependence on fossil fuels.",
            "how does air pollution affect human health?": "Air pollution contributes to respiratory and cardiovascular diseases, increases the risk of stroke, exacerbates asthma and allergies, and poses serious health risks, especially to vulnerable populations.",
            "what are the benefits of using energy-efficient appliances?": "Energy-efficient appliances reduce electricity consumption, lower utility bills, decrease greenhouse gas emissions, and promote sustainable energy use in households and businesses.",
            "how can I advocate for climate action?": "You can advocate for climate action by participating in climate strikes and protests, contacting elected officials, supporting climate policies and initiatives, and raising awareness about climate change.",
            "what is the role of forests in carbon sequestration?": "Forests absorb and store carbon dioxide from the atmosphere, helping mitigate climate change by reducing greenhouse gas concentrations and providing carbon sinks.",
            "how can businesses implement sustainable supply chain practices?": "Businesses can implement sustainable supply chain practices by auditing suppliers, reducing waste and emissions, sourcing ethically produced materials, and promoting transparency and accountability.",
            "what is the impact of plastic pollution on marine ecosystems?": "Plastic pollution harms marine life through ingestion and entanglement, disrupts ecosystems, contaminates food webs, and poses threats to biodiversity and human health.",
            "how can I support renewable energy adoption in my community?": "You can support renewable energy adoption by advocating for local renewable energy projects, investing in community solar programs, and encouraging others to switch to clean energy.",
            "what are some benefits of using electric vehicles?": "Electric vehicles reduce greenhouse gas emissions, lower air pollution, decrease dependence on fossil fuels, and promote energy independence and sustainability in transportation.",
            "how can I encourage sustainable consumption habits?": "You can encourage sustainable consumption habits by promoting conscious consumer choices, supporting eco-friendly products and businesses, reducing waste, and educating others about sustainability.",
            "what is the role of biodiversity in ecosystem services?": "Biodiversity supports ecosystem services like pollination, soil fertility, water purification, and climate regulation, enhancing ecosystem resilience and human well-being.",
        ]


        // Check if user message matches any predefined query
        if let response = predefinedResponses[userMessage.lowercased()] {
            messages.append(Message(text: response, isUserMessage: false))
            isLoading = false
        } else {
            // Default response for unrecognized queries
            messages.append(Message(text: "I'm not sure about that. Please ask another question.", isUserMessage: false))
            isLoading = false
        }
    }
}

struct MessageView: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isUserMessage {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
            } else {
                Text(message.text)
                    .padding()
                    .background(Color.fromRGB(red: 175, green: 242, blue: 209))
                    .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                Spacer()
            }
        }
        .id(message.id)
    }
}

struct MessageInputView: View {
    @Binding var inputText: String
    let sendMessage: () -> Void
    
    var body: some View {
        HStack {
            TextField("go on, dont be shy ;) ", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)

            Button(action: sendMessage) {
                Text("plant")
                    .padding(10)
                    .background(Color.fromRGB(red: 114, green: 204, blue: 152))
                    .foregroundColor(Color.fromRGB(red: 2, green: 89, blue: 57))
                    .cornerRadius(8)
            }
            .padding()
        }
    }
}

//import SwiftUI
////import Alamofire
//
//struct ChatbotView: View {
//    @State private var messages: [String] = []
//    @State private var inputText: String = ""
//    @State private var isLoading: Bool = false
//
//    var body: some View {
//        VStack {
//            ScrollView {
//                ForEach(messages, id: \.self) { message in
//                    Text(message)
//                        .padding()
//                        .background(Color.gray.opacity(0.2))
//                        .cornerRadius(8)
//                        .padding(.horizontal)
//                        .padding(.vertical, 4)
//                }
//            }
//
//            if isLoading {
//                ProgressView()
//            }
//
//            HStack {
//                TextField("ready?", text: $inputText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//
//                Button(action: sendMessage) {
//                    Text("Send")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                }
//                .padding()
//            }
//        }
//        .navigationBarTitle("Sus-yBaka", displayMode: .inline)
//        .padding()
//    }
//
//    func sendMessage() {
//        guard !inputText.isEmpty else { return }
//
//        let userMessage = inputText
//        messages.append("You: \(userMessage)")
//        inputText = ""
//        isLoading = true
//}}
//        let apiKey = "YOUR_OPENAI_API_KEY"
//        let prompt = messages.joined(separator: "\n") + "\nAI:"
//        let parameters: [String: Any] = [
//            "model": "text-davinci-003",
//            "prompt": prompt,
//            "max_tokens": 150
//        ]
//        let headers: HTTPHeaders = [
//            "Authorization": "Bearer \(apiKey)"
//        ]
//
//        AF.request("https://api.openai.com/v1/engines/davinci/completions", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
//            isLoading = false
//
//            switch response.result {
//            case .success(let value):
//                if let json = value as? [String: Any], let choices = json["choices"] as? [[String: Any]], let text = choices.first?["text"] as? String {
//                    messages.append("AI: \(text.trimmingCharacters(in: .whitespacesAndNewlines))")
//                }
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }


//  ChatBotView.swift
//  suslife
//
//  Created by Sarah Saiyed on 29/06/2024.
//

//import SwiftUI
//
//struct ChatBotView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct ChatBotView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatBotView()
//    }
////}
//import SwiftUI
//import Alamofire
//
//struct ChatBotView: View {
//    @State private var userMessage = ""
//    @State private var messages: [String] = []
//
//    var body: some View {
//        VStack {
//            ScrollView {
//                VStack(alignment: .leading) {
//                    ForEach(messages, id: \.self) { message in
//                        Text(message)
//                            .padding()
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                            .padding(4)
//                    }
//                }
//            }
//
//            HStack {
//                TextField("Type your message...", text: $userMessage)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//
//                Button(action: sendMessage) {
//                    Text("Send")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .padding()
//            }
//        }
//        .padding()
//    }
//
//    func sendMessage() {
//        guard !userMessage.isEmpty else { return }
//        messages.append("You: \(userMessage)")
//        fetchChatbotResponse(for: userMessage)
//        userMessage = ""
//    }
//
//    func fetchChatbotResponse(for message: String) {
//        let url = "https://api.openai.com/v1/engines/davinci-codex/completions"
//        let parameters: [String: Any] = [
//            "prompt": message,
//            "max_tokens": 150
//        ]
//        let headers: HTTPHeaders = [
//            "Authorization": "Bearer YOUR_OPENAI_API_KEY",
//            "Content-Type": "application/json"
//        ]
//
//        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: OpenAIResponse.self) { response in
//            switch response.result {
//            case .success(let result):
//                if let text = result.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) {
//                    messages.append("Bot: \(text)")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//}
//
//struct OpenAIResponse: Decodable {
//    let choices: [Choice]
//}
//
//struct Choice: Decodable {
//    let text: String
//}
//
//struct ChatBotView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatBotView()
//    }
//}
