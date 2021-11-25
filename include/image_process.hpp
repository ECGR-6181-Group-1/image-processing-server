#ifndef __IMAGE_PROCESS_H__
#define __IMAGE_PROCESS_H__

#ifdef __cplusplus
extern "C" {
#endif

void grayscale_file(const char* in_file_path, const char* out_file_path);

void edge_detect_file(const char* in_file_path, const char* out_file_path, int lowt, int hight);

void blur_file(const char* in_file_path, const char* out_file_path);

#ifdef __cplusplus
} //end extern c
#endif

#endif /* __IMAGE_PROCESS_H__ */
