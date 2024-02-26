class MastersettingsController < ApplicationController
    def createBusinesstypes
        businesstype = Businesstype.new(businesstype_params)
        if businesstype.save
            render json: {businesstype: businesstype, message: 'New Business Type created' }, status: :created
        else
            render json: { errors: businesstype.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def showBusinesstypes
        businesstype = Businesstype.all
        render json: businesstype
    end

    def createCategory
        category = Category.new(category_params)
        if category.save
            render json: {category: category, message: 'New Category created' }, status: :created
        else
            render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def showCategory
        category = Category.all
        render json: category
    end

    def createSubcategory
        subcategory = BusinessSubcategory.new(subcategory_params)
        if subcategory.save
            render json: {subcategory: subcategory, message: 'New Sub Category created' }, status: :created
        else
            render json: { errors: subcategory.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def showSubcategory
        subcategory = BusinessSubcategory.all
        render json: subcategory
    end

    def createCurrency
        currency = Currency.new(currency_params)
        if currency.save
            render json: {currency: currency, message: 'New Currency created' }, status: :created
        else
            render json: { errors: currency.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def showCurrency
        currency = Currency.all
        render json: currency
    end

    def createDocumenttype
        documenttype = DocumentType.new(documenttype_params)
        if documenttype.save
            render json: {documenttype: documenttype, message: 'New Document Type created' }, status: :created
        else
            render json: { errors: documenttype.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def showDocumenttype
        documenttype = DocumentType.all
        render json: documenttype
    end

    def createDocumentcategory
        documentcategory = DocumentCategory.new(documentcategory_params)
        if documentcategory.save
            render json: {documentcategory: documentcategory, message: 'New Document Category created' }, status: :created
        else
            render json: { errors: documentcategory.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def showDocumentcategory
        documentcategory = DocumentCategory.all
        render json: documentcategory
    end

    def createBank
        bank = Bank.new(bank_params)
        if bank.save
            render json: {bank: bank, message: 'New Bank created' }, status: :created
        else
            render json: { errors: bank.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def showBank
        bank = Bank.all
        render json: bank
    end

    private
    
    def businesstype_params
        params.permit(:businesstypename)
    end

    def category_params
        params.permit(:categoryname, :shortname)
    end

    def subcategory_params
        params.permit(:subcategoryname, :categoryname)
    end

    def currency_params
        params.permit(:currencyname, :currencycode)
    end

    def documenttype_params
        params.permit(:documenttype)
    end

     def documentcategory_params
        params.permit(:documentname, :documenttype, :side, :documentnumberlength)
    end

    def bank_params
        params.permit(:bankname, :divid, :bankurl, :bankimage)
    end
end
