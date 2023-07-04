CREATE TABLE ft_transaction_types(
    transaction_type_id UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
    transaction_type VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    created_by UUID,
    created_at TIMESTAMP,
    updated_by UUID,
    updated_at TIMESTAMP,
    deleted_by UUID,
    deleted_at TIMESTAMP
);

INSERT INTO ft_transaction_types (transaction_type) VALUES('CR'), ('DB');

CREATE TABLE ft_transactions (
    transaction_id UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    amount NUMERIC NOT NULL,
    transaction_date TIMESTAMP NOT NULL,
    transaction_type_id UUID NOT NULL,
    created_by UUID,
    created_at TIMESTAMP,
    updated_by UUID,
    updated_at TIMESTAMP,
    deleted_by UUID,
    deleted_at TIMESTAMP,
    CONSTRAINT fk_transaction_type
        FOREIGN KEY (transaction_type_id)
            REFERENCES ft_transaction_types(transaction_type_id)
);