package by.urbel.service.impl;

import by.urbel.dao.ProductCategoryDao;
import by.urbel.dao.exception.DaoException;
import by.urbel.dao.impl.ProductCategoryDaoImpl;
import by.urbel.entity.ProductCategory;
import by.urbel.service.ProductCategoryService;
import by.urbel.service.exception.ServiceException;

import java.util.List;

public class ProductCategoryServiceImpl implements ProductCategoryService {
    private final ProductCategoryDao categoryDao = new ProductCategoryDaoImpl();

    @Override
    public void create(ProductCategory category) throws ServiceException {
        validateCategory(category);
        try {
            categoryDao.create(category);
        } catch (DaoException e) {
            throw new ServiceException(e.getMessage(), e);
        }
    }

    @Override
    public List<ProductCategory> readAll() throws ServiceException {
        try {
            return categoryDao.readAll();
        } catch (DaoException e) {
            throw new ServiceException(e.getMessage(), e);
        }
    }

    @Override
    public void update(ProductCategory category) throws ServiceException {
        validateCategory(category);
        try {
            categoryDao.update(category);
        } catch (DaoException e) {
            throw new ServiceException(e.getMessage(), e);
        }
    }

    @Override
    public void delete(long id) throws ServiceException {
        try {
            categoryDao.delete(id);
        } catch (DaoException e) {
            throw new ServiceException(e.getMessage(), e);
        }
    }

    private void validateCategory(ProductCategory category) throws ServiceException {
        if (category == null) {
            throw new ServiceException("Product category cannot be null");
        }
        if (category.getName() == null || category.getName().trim().isEmpty()) {
            throw new ServiceException("Product category name cannot be null or empty");
        }
    }
}
