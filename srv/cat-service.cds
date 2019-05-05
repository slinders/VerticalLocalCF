using EPM as EPM from '../db/data-model';

service CatalogService {
    @readonly entity Address as projection on EPM.Address;
}
