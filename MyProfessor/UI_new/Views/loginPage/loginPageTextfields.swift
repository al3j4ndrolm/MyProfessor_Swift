import SwiftUI

struct loginPageTextfields: View {
    @State var context: String
    @State var placeholder: String
    @Binding var data: String
 

    var body: some View {
        VStack {
            textfieldBody(context: context, data: $data, placeholder: placeholder)
        }
    }
    
    private func textfieldBody(context: String, data: Binding<String>, placeholder: String) -> some View {
        VStack(alignment: .leading) {
            Text(context)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundStyle(.white)
                .padding(.leading, 30)
            textfield(data: data, placeholder: placeholder)
        }
        .padding(.top, 20)
    }
    
    private func textfield(data: Binding<String>, placeholder: String) -> some View {
        ZStack(alignment: .leading) {
            TextField("", text: data)
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
