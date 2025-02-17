import SwiftUI

struct loginPageTextfields: View {
    @State var studentId: String
    @State var studentPassword: String  //In figma we we have birthdate but ill do password for n

    var body: some View {
        VStack {
            textfieldBody(context: "Student ID", id: $studentId, placeholder: "ex. 12345678")
            textfieldBody(context: "Password", id: $studentPassword, placeholder: "supersecurepassword")
        }
    }
    
    private func textfieldBody(context: String, id: Binding<String>, placeholder: String) -> some View {
        VStack(alignment: .leading) {
            Text(context)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundStyle(.white)
                .padding(.leading, 30)
            textfield(id: id, placeholder: placeholder)
        }
        .padding(.top, 20)
    }
    
    private func textfield(id: Binding<String>, placeholder: String) -> some View {
        ZStack(alignment: .leading) {
            TextField("", text: id)
                .foregroundStyle(.black) // if empty dull color change later
                .padding(.leading, 20)
                .padding(.vertical, 12)
                .background(RoundedRectangle(cornerRadius: 32).fill(searchBarColor))
                .padding(.leading, 20)
                .padding(.trailing, 30)
            if id.wrappedValue.isEmpty {
                Text(placeholder)
                    .font(.subheadline)
                    .italic()
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary.opacity(0.7))
                    .padding(.leading, 40)
            }
        }
    }
}

#Preview {
    ZStack {
        backgroundColor()
        loginPageTextfields(studentId: "", studentPassword: "")
    }
}
