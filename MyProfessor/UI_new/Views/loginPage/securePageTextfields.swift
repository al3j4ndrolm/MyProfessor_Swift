import SwiftUI

struct  loginPageSecureFields: View {
    @State var context: String
    @State var placeholder: String
    @Binding var data: String
 

    var body: some View {
        VStack {
            secureFieldBody(context: context, data: $data, placeholder: placeholder)
        }
    }
    
    private func secureFieldBody(context: String, data: Binding<String>, placeholder: String) -> some View {
        VStack(alignment: .leading) {
            Text(context)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundStyle(.white)
                .padding(.leading, 30)
            secureField(data: data, placeholder: placeholder)
        }
        .padding(.top, 20)
    }
    
    private func secureField(data: Binding<String>, placeholder: String) -> some View {
        ZStack(alignment: .leading) {
            SecureField("", text: data)
                .foregroundStyle(.black) // if empty dull color change later
                .padding(.leading, 20)
                .padding(.vertical, 12)
                .background(RoundedRectangle(cornerRadius: 32).fill(searchBarColor))
                .padding(.leading, 20)
                .padding(.trailing, 30)
            if data.wrappedValue.isEmpty {
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
//        loginPageTextfields(studentId: "", studentPassword: "")
    }
}
