abstract class IMapper<T, R> {
  R toModel(T entity);

  T toEntity(R model);
}
