using EPM as EPM from '../db/data-model';

service CatalogService {
    @readonly entity Books as projection on EPM.Books;
}
