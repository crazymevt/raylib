/* shim.c — generated from raylib_api.json by raylib-generator. Do not edit.
 *
 * raylib passes small structs by value. Each wrapper here takes pointers
 * instead, and returns a struct through an extra pointer, so Lisp can call
 * these without libffi. */

#include "raylib.h"

#if defined(_WIN32)
#define SHIM __declspec(dllexport)
#else
#define SHIM __attribute__((visibility("default")))
#endif

/* Sizes of the structs, in raylib_api.json order, to check Lisp's layouts. */
SHIM int rlshim_struct_size(int i)
{
    switch (i) {
    case 0: return (int)sizeof(Vector2);
    case 1: return (int)sizeof(Vector3);
    case 2: return (int)sizeof(Vector4);
    case 3: return (int)sizeof(Matrix);
    case 4: return (int)sizeof(Color);
    case 5: return (int)sizeof(Rectangle);
    case 6: return (int)sizeof(Image);
    case 7: return (int)sizeof(Texture);
    case 8: return (int)sizeof(RenderTexture);
    case 9: return (int)sizeof(NPatchInfo);
    case 10: return (int)sizeof(GlyphInfo);
    case 11: return (int)sizeof(Font);
    case 12: return (int)sizeof(Camera3D);
    case 13: return (int)sizeof(Camera2D);
    case 14: return (int)sizeof(Mesh);
    case 15: return (int)sizeof(Shader);
    case 16: return (int)sizeof(MaterialMap);
    case 17: return (int)sizeof(Material);
    case 18: return (int)sizeof(Transform);
    case 19: return (int)sizeof(BoneInfo);
    case 20: return (int)sizeof(ModelSkeleton);
    case 21: return (int)sizeof(Model);
    case 22: return (int)sizeof(ModelAnimation);
    case 23: return (int)sizeof(Ray);
    case 24: return (int)sizeof(RayCollision);
    case 25: return (int)sizeof(BoundingBox);
    case 26: return (int)sizeof(Wave);
    case 27: return (int)sizeof(AudioStream);
    case 28: return (int)sizeof(Sound);
    case 29: return (int)sizeof(Music);
    case 30: return (int)sizeof(VrDeviceInfo);
    case 31: return (int)sizeof(VrStereoConfig);
    case 32: return (int)sizeof(FilePathList);
    case 33: return (int)sizeof(AutomationEvent);
    case 34: return (int)sizeof(AutomationEventList);
    default: return -1;
    }
}

SHIM void rlshim_SetWindowIcon(const Image *image)
{
    SetWindowIcon(*image);
}

SHIM void rlshim_GetMonitorPosition(int monitor, Vector2 *out)
{
    *out = GetMonitorPosition(monitor);
}

SHIM void rlshim_GetWindowPosition(Vector2 *out)
{
    *out = GetWindowPosition();
}

SHIM void rlshim_GetWindowScaleDPI(Vector2 *out)
{
    *out = GetWindowScaleDPI();
}

SHIM void rlshim_GetClipboardImage(Image *out)
{
    *out = GetClipboardImage();
}

SHIM void rlshim_ClearBackground(const Color *color)
{
    ClearBackground(*color);
}

SHIM void rlshim_BeginMode2D(const Camera2D *camera)
{
    BeginMode2D(*camera);
}

SHIM void rlshim_BeginMode3D(const Camera3D *camera)
{
    BeginMode3D(*camera);
}

SHIM void rlshim_BeginTextureMode(const RenderTexture2D *target)
{
    BeginTextureMode(*target);
}

SHIM void rlshim_BeginShaderMode(const Shader *shader)
{
    BeginShaderMode(*shader);
}

SHIM void rlshim_BeginVrStereoMode(const VrStereoConfig *config)
{
    BeginVrStereoMode(*config);
}

SHIM void rlshim_LoadVrStereoConfig(const VrDeviceInfo *device, VrStereoConfig *out)
{
    *out = LoadVrStereoConfig(*device);
}

SHIM void rlshim_UnloadVrStereoConfig(const VrStereoConfig *config)
{
    UnloadVrStereoConfig(*config);
}

SHIM void rlshim_LoadShader(const char *vsFileName, const char *fsFileName, Shader *out)
{
    *out = LoadShader(vsFileName, fsFileName);
}

SHIM void rlshim_LoadShaderFromMemory(const char *vsCode, const char *fsCode, Shader *out)
{
    *out = LoadShaderFromMemory(vsCode, fsCode);
}

SHIM bool rlshim_IsShaderValid(const Shader *shader)
{
    return IsShaderValid(*shader);
}

SHIM int rlshim_GetShaderLocation(const Shader *shader, const char *uniformName)
{
    return GetShaderLocation(*shader, uniformName);
}

SHIM int rlshim_GetShaderLocationAttrib(const Shader *shader, const char *attribName)
{
    return GetShaderLocationAttrib(*shader, attribName);
}

SHIM void rlshim_SetShaderValue(const Shader *shader, int locIndex, const void *value, int uniformType)
{
    SetShaderValue(*shader, locIndex, value, uniformType);
}

SHIM void rlshim_SetShaderValueV(const Shader *shader, int locIndex, const void *value, int uniformType, int count)
{
    SetShaderValueV(*shader, locIndex, value, uniformType, count);
}

SHIM void rlshim_SetShaderValueMatrix(const Shader *shader, int locIndex, const Matrix *mat)
{
    SetShaderValueMatrix(*shader, locIndex, *mat);
}

SHIM void rlshim_SetShaderValueTexture(const Shader *shader, int locIndex, const Texture2D *texture)
{
    SetShaderValueTexture(*shader, locIndex, *texture);
}

SHIM void rlshim_UnloadShader(const Shader *shader)
{
    UnloadShader(*shader);
}

SHIM void rlshim_GetScreenToWorldRay(const Vector2 *position, const Camera *camera, Ray *out)
{
    *out = GetScreenToWorldRay(*position, *camera);
}

SHIM void rlshim_GetScreenToWorldRayEx(const Vector2 *position, const Camera *camera, int width, int height, Ray *out)
{
    *out = GetScreenToWorldRayEx(*position, *camera, width, height);
}

SHIM void rlshim_GetWorldToScreen(const Vector3 *position, const Camera *camera, Vector2 *out)
{
    *out = GetWorldToScreen(*position, *camera);
}

SHIM void rlshim_GetWorldToScreenEx(const Vector3 *position, const Camera *camera, int width, int height, Vector2 *out)
{
    *out = GetWorldToScreenEx(*position, *camera, width, height);
}

SHIM void rlshim_GetWorldToScreen2D(const Vector2 *position, const Camera2D *camera, Vector2 *out)
{
    *out = GetWorldToScreen2D(*position, *camera);
}

SHIM void rlshim_GetScreenToWorld2D(const Vector2 *position, const Camera2D *camera, Vector2 *out)
{
    *out = GetScreenToWorld2D(*position, *camera);
}

SHIM void rlshim_GetCameraMatrix(const Camera *camera, Matrix *out)
{
    *out = GetCameraMatrix(*camera);
}

SHIM void rlshim_GetCameraMatrix2D(const Camera2D *camera, Matrix *out)
{
    *out = GetCameraMatrix2D(*camera);
}

SHIM void rlshim_LoadDirectoryFiles(const char *dirPath, FilePathList *out)
{
    *out = LoadDirectoryFiles(dirPath);
}

SHIM void rlshim_LoadDirectoryFilesEx(const char *basePath, const char *filter, bool scanSubdirs, FilePathList *out)
{
    *out = LoadDirectoryFilesEx(basePath, filter, scanSubdirs);
}

SHIM void rlshim_UnloadDirectoryFiles(const FilePathList *files)
{
    UnloadDirectoryFiles(*files);
}

SHIM void rlshim_LoadDroppedFiles(FilePathList *out)
{
    *out = LoadDroppedFiles();
}

SHIM void rlshim_UnloadDroppedFiles(const FilePathList *files)
{
    UnloadDroppedFiles(*files);
}

SHIM void rlshim_LoadAutomationEventList(const char *fileName, AutomationEventList *out)
{
    *out = LoadAutomationEventList(fileName);
}

SHIM void rlshim_UnloadAutomationEventList(const AutomationEventList *list)
{
    UnloadAutomationEventList(*list);
}

SHIM bool rlshim_ExportAutomationEventList(const AutomationEventList *list, const char *fileName)
{
    return ExportAutomationEventList(*list, fileName);
}

SHIM void rlshim_PlayAutomationEvent(const AutomationEvent *event)
{
    PlayAutomationEvent(*event);
}

SHIM void rlshim_GetMousePosition(Vector2 *out)
{
    *out = GetMousePosition();
}

SHIM void rlshim_GetMouseDelta(Vector2 *out)
{
    *out = GetMouseDelta();
}

SHIM void rlshim_GetMouseWheelMoveV(Vector2 *out)
{
    *out = GetMouseWheelMoveV();
}

SHIM void rlshim_GetTouchPosition(int index, Vector2 *out)
{
    *out = GetTouchPosition(index);
}

SHIM void rlshim_GetGestureDragVector(Vector2 *out)
{
    *out = GetGestureDragVector();
}

SHIM void rlshim_GetGesturePinchVector(Vector2 *out)
{
    *out = GetGesturePinchVector();
}

SHIM void rlshim_UpdateCameraPro(Camera *camera, const Vector3 *movement, const Vector3 *rotation, float zoom)
{
    UpdateCameraPro(camera, *movement, *rotation, zoom);
}

SHIM void rlshim_SetShapesTexture(const Texture2D *texture, const Rectangle *source)
{
    SetShapesTexture(*texture, *source);
}

SHIM void rlshim_GetShapesTexture(Texture2D *out)
{
    *out = GetShapesTexture();
}

SHIM void rlshim_GetShapesTextureRectangle(Rectangle *out)
{
    *out = GetShapesTextureRectangle();
}

SHIM void rlshim_DrawPixel(int posX, int posY, const Color *color)
{
    DrawPixel(posX, posY, *color);
}

SHIM void rlshim_DrawPixelV(const Vector2 *position, const Color *color)
{
    DrawPixelV(*position, *color);
}

SHIM void rlshim_DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, const Color *color)
{
    DrawLine(startPosX, startPosY, endPosX, endPosY, *color);
}

SHIM void rlshim_DrawLineV(const Vector2 *startPos, const Vector2 *endPos, const Color *color)
{
    DrawLineV(*startPos, *endPos, *color);
}

SHIM void rlshim_DrawLineEx(const Vector2 *startPos, const Vector2 *endPos, float thick, const Color *color)
{
    DrawLineEx(*startPos, *endPos, thick, *color);
}

SHIM void rlshim_DrawLineStrip(const Vector2 *points, int pointCount, const Color *color)
{
    DrawLineStrip(points, pointCount, *color);
}

SHIM void rlshim_DrawLineBezier(const Vector2 *startPos, const Vector2 *endPos, float thick, const Color *color)
{
    DrawLineBezier(*startPos, *endPos, thick, *color);
}

SHIM void rlshim_DrawLineDashed(const Vector2 *startPos, const Vector2 *endPos, int dashSize, int spaceSize, const Color *color)
{
    DrawLineDashed(*startPos, *endPos, dashSize, spaceSize, *color);
}

SHIM void rlshim_DrawCircle(int centerX, int centerY, float radius, const Color *color)
{
    DrawCircle(centerX, centerY, radius, *color);
}

SHIM void rlshim_DrawCircleV(const Vector2 *center, float radius, const Color *color)
{
    DrawCircleV(*center, radius, *color);
}

SHIM void rlshim_DrawCircleGradient(const Vector2 *center, float radius, const Color *inner, const Color *outer)
{
    DrawCircleGradient(*center, radius, *inner, *outer);
}

SHIM void rlshim_DrawCircleSector(const Vector2 *center, float radius, float startAngle, float endAngle, int segments, const Color *color)
{
    DrawCircleSector(*center, radius, startAngle, endAngle, segments, *color);
}

SHIM void rlshim_DrawCircleSectorLines(const Vector2 *center, float radius, float startAngle, float endAngle, int segments, const Color *color)
{
    DrawCircleSectorLines(*center, radius, startAngle, endAngle, segments, *color);
}

SHIM void rlshim_DrawCircleLines(int centerX, int centerY, float radius, const Color *color)
{
    DrawCircleLines(centerX, centerY, radius, *color);
}

SHIM void rlshim_DrawCircleLinesV(const Vector2 *center, float radius, const Color *color)
{
    DrawCircleLinesV(*center, radius, *color);
}

SHIM void rlshim_DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, const Color *color)
{
    DrawEllipse(centerX, centerY, radiusH, radiusV, *color);
}

SHIM void rlshim_DrawEllipseV(const Vector2 *center, float radiusH, float radiusV, const Color *color)
{
    DrawEllipseV(*center, radiusH, radiusV, *color);
}

SHIM void rlshim_DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, const Color *color)
{
    DrawEllipseLines(centerX, centerY, radiusH, radiusV, *color);
}

SHIM void rlshim_DrawEllipseLinesV(const Vector2 *center, float radiusH, float radiusV, const Color *color)
{
    DrawEllipseLinesV(*center, radiusH, radiusV, *color);
}

SHIM void rlshim_DrawRing(const Vector2 *center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, const Color *color)
{
    DrawRing(*center, innerRadius, outerRadius, startAngle, endAngle, segments, *color);
}

SHIM void rlshim_DrawRingLines(const Vector2 *center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, const Color *color)
{
    DrawRingLines(*center, innerRadius, outerRadius, startAngle, endAngle, segments, *color);
}

SHIM void rlshim_DrawRectangle(int posX, int posY, int width, int height, const Color *color)
{
    DrawRectangle(posX, posY, width, height, *color);
}

SHIM void rlshim_DrawRectangleV(const Vector2 *position, const Vector2 *size, const Color *color)
{
    DrawRectangleV(*position, *size, *color);
}

SHIM void rlshim_DrawRectangleRec(const Rectangle *rec, const Color *color)
{
    DrawRectangleRec(*rec, *color);
}

SHIM void rlshim_DrawRectanglePro(const Rectangle *rec, const Vector2 *origin, float rotation, const Color *color)
{
    DrawRectanglePro(*rec, *origin, rotation, *color);
}

SHIM void rlshim_DrawRectangleGradientV(int posX, int posY, int width, int height, const Color *top, const Color *bottom)
{
    DrawRectangleGradientV(posX, posY, width, height, *top, *bottom);
}

SHIM void rlshim_DrawRectangleGradientH(int posX, int posY, int width, int height, const Color *left, const Color *right)
{
    DrawRectangleGradientH(posX, posY, width, height, *left, *right);
}

SHIM void rlshim_DrawRectangleGradientEx(const Rectangle *rec, const Color *topLeft, const Color *bottomLeft, const Color *bottomRight, const Color *topRight)
{
    DrawRectangleGradientEx(*rec, *topLeft, *bottomLeft, *bottomRight, *topRight);
}

SHIM void rlshim_DrawRectangleLines(int posX, int posY, int width, int height, const Color *color)
{
    DrawRectangleLines(posX, posY, width, height, *color);
}

SHIM void rlshim_DrawRectangleLinesEx(const Rectangle *rec, float lineThick, const Color *color)
{
    DrawRectangleLinesEx(*rec, lineThick, *color);
}

SHIM void rlshim_DrawRectangleRounded(const Rectangle *rec, float roundness, int segments, const Color *color)
{
    DrawRectangleRounded(*rec, roundness, segments, *color);
}

SHIM void rlshim_DrawRectangleRoundedLines(const Rectangle *rec, float roundness, int segments, const Color *color)
{
    DrawRectangleRoundedLines(*rec, roundness, segments, *color);
}

SHIM void rlshim_DrawRectangleRoundedLinesEx(const Rectangle *rec, float roundness, int segments, float lineThick, const Color *color)
{
    DrawRectangleRoundedLinesEx(*rec, roundness, segments, lineThick, *color);
}

SHIM void rlshim_DrawTriangle(const Vector2 *v1, const Vector2 *v2, const Vector2 *v3, const Color *color)
{
    DrawTriangle(*v1, *v2, *v3, *color);
}

SHIM void rlshim_DrawTriangleLines(const Vector2 *v1, const Vector2 *v2, const Vector2 *v3, const Color *color)
{
    DrawTriangleLines(*v1, *v2, *v3, *color);
}

SHIM void rlshim_DrawTriangleFan(const Vector2 *points, int pointCount, const Color *color)
{
    DrawTriangleFan(points, pointCount, *color);
}

SHIM void rlshim_DrawTriangleStrip(const Vector2 *points, int pointCount, const Color *color)
{
    DrawTriangleStrip(points, pointCount, *color);
}

SHIM void rlshim_DrawPoly(const Vector2 *center, int sides, float radius, float rotation, const Color *color)
{
    DrawPoly(*center, sides, radius, rotation, *color);
}

SHIM void rlshim_DrawPolyLines(const Vector2 *center, int sides, float radius, float rotation, const Color *color)
{
    DrawPolyLines(*center, sides, radius, rotation, *color);
}

SHIM void rlshim_DrawPolyLinesEx(const Vector2 *center, int sides, float radius, float rotation, float lineThick, const Color *color)
{
    DrawPolyLinesEx(*center, sides, radius, rotation, lineThick, *color);
}

SHIM void rlshim_DrawSplineLinear(const Vector2 *points, int pointCount, float thick, const Color *color)
{
    DrawSplineLinear(points, pointCount, thick, *color);
}

SHIM void rlshim_DrawSplineBasis(const Vector2 *points, int pointCount, float thick, const Color *color)
{
    DrawSplineBasis(points, pointCount, thick, *color);
}

SHIM void rlshim_DrawSplineCatmullRom(const Vector2 *points, int pointCount, float thick, const Color *color)
{
    DrawSplineCatmullRom(points, pointCount, thick, *color);
}

SHIM void rlshim_DrawSplineBezierQuadratic(const Vector2 *points, int pointCount, float thick, const Color *color)
{
    DrawSplineBezierQuadratic(points, pointCount, thick, *color);
}

SHIM void rlshim_DrawSplineBezierCubic(const Vector2 *points, int pointCount, float thick, const Color *color)
{
    DrawSplineBezierCubic(points, pointCount, thick, *color);
}

SHIM void rlshim_DrawSplineSegmentLinear(const Vector2 *p1, const Vector2 *p2, float thick, const Color *color)
{
    DrawSplineSegmentLinear(*p1, *p2, thick, *color);
}

SHIM void rlshim_DrawSplineSegmentBasis(const Vector2 *p1, const Vector2 *p2, const Vector2 *p3, const Vector2 *p4, float thick, const Color *color)
{
    DrawSplineSegmentBasis(*p1, *p2, *p3, *p4, thick, *color);
}

SHIM void rlshim_DrawSplineSegmentCatmullRom(const Vector2 *p1, const Vector2 *p2, const Vector2 *p3, const Vector2 *p4, float thick, const Color *color)
{
    DrawSplineSegmentCatmullRom(*p1, *p2, *p3, *p4, thick, *color);
}

SHIM void rlshim_DrawSplineSegmentBezierQuadratic(const Vector2 *p1, const Vector2 *c2, const Vector2 *p3, float thick, const Color *color)
{
    DrawSplineSegmentBezierQuadratic(*p1, *c2, *p3, thick, *color);
}

SHIM void rlshim_DrawSplineSegmentBezierCubic(const Vector2 *p1, const Vector2 *c2, const Vector2 *c3, const Vector2 *p4, float thick, const Color *color)
{
    DrawSplineSegmentBezierCubic(*p1, *c2, *c3, *p4, thick, *color);
}

SHIM void rlshim_GetSplinePointLinear(const Vector2 *startPos, const Vector2 *endPos, float t, Vector2 *out)
{
    *out = GetSplinePointLinear(*startPos, *endPos, t);
}

SHIM void rlshim_GetSplinePointBasis(const Vector2 *p1, const Vector2 *p2, const Vector2 *p3, const Vector2 *p4, float t, Vector2 *out)
{
    *out = GetSplinePointBasis(*p1, *p2, *p3, *p4, t);
}

SHIM void rlshim_GetSplinePointCatmullRom(const Vector2 *p1, const Vector2 *p2, const Vector2 *p3, const Vector2 *p4, float t, Vector2 *out)
{
    *out = GetSplinePointCatmullRom(*p1, *p2, *p3, *p4, t);
}

SHIM void rlshim_GetSplinePointBezierQuad(const Vector2 *p1, const Vector2 *c2, const Vector2 *p3, float t, Vector2 *out)
{
    *out = GetSplinePointBezierQuad(*p1, *c2, *p3, t);
}

SHIM void rlshim_GetSplinePointBezierCubic(const Vector2 *p1, const Vector2 *c2, const Vector2 *c3, const Vector2 *p4, float t, Vector2 *out)
{
    *out = GetSplinePointBezierCubic(*p1, *c2, *c3, *p4, t);
}

SHIM bool rlshim_CheckCollisionRecs(const Rectangle *rec1, const Rectangle *rec2)
{
    return CheckCollisionRecs(*rec1, *rec2);
}

SHIM bool rlshim_CheckCollisionCircles(const Vector2 *center1, float radius1, const Vector2 *center2, float radius2)
{
    return CheckCollisionCircles(*center1, radius1, *center2, radius2);
}

SHIM bool rlshim_CheckCollisionCircleRec(const Vector2 *center, float radius, const Rectangle *rec)
{
    return CheckCollisionCircleRec(*center, radius, *rec);
}

SHIM bool rlshim_CheckCollisionCircleLine(const Vector2 *center, float radius, const Vector2 *p1, const Vector2 *p2)
{
    return CheckCollisionCircleLine(*center, radius, *p1, *p2);
}

SHIM bool rlshim_CheckCollisionPointRec(const Vector2 *point, const Rectangle *rec)
{
    return CheckCollisionPointRec(*point, *rec);
}

SHIM bool rlshim_CheckCollisionPointCircle(const Vector2 *point, const Vector2 *center, float radius)
{
    return CheckCollisionPointCircle(*point, *center, radius);
}

SHIM bool rlshim_CheckCollisionPointTriangle(const Vector2 *point, const Vector2 *p1, const Vector2 *p2, const Vector2 *p3)
{
    return CheckCollisionPointTriangle(*point, *p1, *p2, *p3);
}

SHIM bool rlshim_CheckCollisionPointLine(const Vector2 *point, const Vector2 *p1, const Vector2 *p2, int threshold)
{
    return CheckCollisionPointLine(*point, *p1, *p2, threshold);
}

SHIM bool rlshim_CheckCollisionPointPoly(const Vector2 *point, const Vector2 *points, int pointCount)
{
    return CheckCollisionPointPoly(*point, points, pointCount);
}

SHIM bool rlshim_CheckCollisionLines(const Vector2 *startPos1, const Vector2 *endPos1, const Vector2 *startPos2, const Vector2 *endPos2, Vector2 *collisionPoint)
{
    return CheckCollisionLines(*startPos1, *endPos1, *startPos2, *endPos2, collisionPoint);
}

SHIM void rlshim_GetCollisionRec(const Rectangle *rec1, const Rectangle *rec2, Rectangle *out)
{
    *out = GetCollisionRec(*rec1, *rec2);
}

SHIM void rlshim_LoadImage(const char *fileName, Image *out)
{
    *out = LoadImage(fileName);
}

SHIM void rlshim_LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize, Image *out)
{
    *out = LoadImageRaw(fileName, width, height, format, headerSize);
}

SHIM void rlshim_LoadImageAnim(const char *fileName, int *frames, Image *out)
{
    *out = LoadImageAnim(fileName, frames);
}

SHIM void rlshim_LoadImageAnimFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int *frames, Image *out)
{
    *out = LoadImageAnimFromMemory(fileType, fileData, dataSize, frames);
}

SHIM void rlshim_LoadImageFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, Image *out)
{
    *out = LoadImageFromMemory(fileType, fileData, dataSize);
}

SHIM void rlshim_LoadImageFromTexture(const Texture2D *texture, Image *out)
{
    *out = LoadImageFromTexture(*texture);
}

SHIM void rlshim_LoadImageFromScreen(Image *out)
{
    *out = LoadImageFromScreen();
}

SHIM bool rlshim_IsImageValid(const Image *image)
{
    return IsImageValid(*image);
}

SHIM void rlshim_UnloadImage(const Image *image)
{
    UnloadImage(*image);
}

SHIM bool rlshim_ExportImage(const Image *image, const char *fileName)
{
    return ExportImage(*image, fileName);
}

SHIM unsigned char * rlshim_ExportImageToMemory(const Image *image, const char *fileType, int *fileSize)
{
    return ExportImageToMemory(*image, fileType, fileSize);
}

SHIM bool rlshim_ExportImageAsCode(const Image *image, const char *fileName)
{
    return ExportImageAsCode(*image, fileName);
}

SHIM void rlshim_GenImageColor(int width, int height, const Color *color, Image *out)
{
    *out = GenImageColor(width, height, *color);
}

SHIM void rlshim_GenImageGradientLinear(int width, int height, int direction, const Color *start, const Color *end, Image *out)
{
    *out = GenImageGradientLinear(width, height, direction, *start, *end);
}

SHIM void rlshim_GenImageGradientRadial(int width, int height, float density, const Color *inner, const Color *outer, Image *out)
{
    *out = GenImageGradientRadial(width, height, density, *inner, *outer);
}

SHIM void rlshim_GenImageGradientSquare(int width, int height, float density, const Color *inner, const Color *outer, Image *out)
{
    *out = GenImageGradientSquare(width, height, density, *inner, *outer);
}

SHIM void rlshim_GenImageChecked(int width, int height, int checksX, int checksY, const Color *col1, const Color *col2, Image *out)
{
    *out = GenImageChecked(width, height, checksX, checksY, *col1, *col2);
}

SHIM void rlshim_GenImageWhiteNoise(int width, int height, float factor, Image *out)
{
    *out = GenImageWhiteNoise(width, height, factor);
}

SHIM void rlshim_GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale, Image *out)
{
    *out = GenImagePerlinNoise(width, height, offsetX, offsetY, scale);
}

SHIM void rlshim_GenImageCellular(int width, int height, int tileSize, Image *out)
{
    *out = GenImageCellular(width, height, tileSize);
}

SHIM void rlshim_GenImageText(int width, int height, const char *text, Image *out)
{
    *out = GenImageText(width, height, text);
}

SHIM void rlshim_ImageCopy(const Image *image, Image *out)
{
    *out = ImageCopy(*image);
}

SHIM void rlshim_ImageFromImage(const Image *image, const Rectangle *rec, Image *out)
{
    *out = ImageFromImage(*image, *rec);
}

SHIM void rlshim_ImageFromChannel(const Image *image, int selectedChannel, Image *out)
{
    *out = ImageFromChannel(*image, selectedChannel);
}

SHIM void rlshim_ImageText(const char *text, int fontSize, const Color *color, Image *out)
{
    *out = ImageText(text, fontSize, *color);
}

SHIM void rlshim_ImageTextEx(const Font *font, const char *text, float fontSize, float spacing, const Color *tint, Image *out)
{
    *out = ImageTextEx(*font, text, fontSize, spacing, *tint);
}

SHIM void rlshim_ImageToPOT(Image *image, const Color *fill)
{
    ImageToPOT(image, *fill);
}

SHIM void rlshim_ImageCrop(Image *image, const Rectangle *crop)
{
    ImageCrop(image, *crop);
}

SHIM void rlshim_ImageAlphaClear(Image *image, const Color *color, float threshold)
{
    ImageAlphaClear(image, *color, threshold);
}

SHIM void rlshim_ImageAlphaMask(Image *image, const Image *alphaMask)
{
    ImageAlphaMask(image, *alphaMask);
}

SHIM void rlshim_ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, const Color *fill)
{
    ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, *fill);
}

SHIM void rlshim_ImageColorTint(Image *image, const Color *color)
{
    ImageColorTint(image, *color);
}

SHIM void rlshim_ImageColorReplace(Image *image, const Color *color, const Color *replace)
{
    ImageColorReplace(image, *color, *replace);
}

SHIM Color * rlshim_LoadImageColors(const Image *image)
{
    return LoadImageColors(*image);
}

SHIM Color * rlshim_LoadImagePalette(const Image *image, int maxPaletteSize, int *colorCount)
{
    return LoadImagePalette(*image, maxPaletteSize, colorCount);
}

SHIM void rlshim_GetImageAlphaBorder(const Image *image, float threshold, Rectangle *out)
{
    *out = GetImageAlphaBorder(*image, threshold);
}

SHIM void rlshim_GetImageColor(const Image *image, int x, int y, Color *out)
{
    *out = GetImageColor(*image, x, y);
}

SHIM void rlshim_ImageClearBackground(Image *dst, const Color *color)
{
    ImageClearBackground(dst, *color);
}

SHIM void rlshim_ImageDrawPixel(Image *dst, int posX, int posY, const Color *color)
{
    ImageDrawPixel(dst, posX, posY, *color);
}

SHIM void rlshim_ImageDrawPixelV(Image *dst, const Vector2 *position, const Color *color)
{
    ImageDrawPixelV(dst, *position, *color);
}

SHIM void rlshim_ImageDrawLine(Image *dst, int startPosX, int startPosY, int endPosX, int endPosY, const Color *color)
{
    ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, *color);
}

SHIM void rlshim_ImageDrawLineV(Image *dst, const Vector2 *start, const Vector2 *end, const Color *color)
{
    ImageDrawLineV(dst, *start, *end, *color);
}

SHIM void rlshim_ImageDrawLineEx(Image *dst, const Vector2 *start, const Vector2 *end, int thick, const Color *color)
{
    ImageDrawLineEx(dst, *start, *end, thick, *color);
}

SHIM void rlshim_ImageDrawCircle(Image *dst, int centerX, int centerY, int radius, const Color *color)
{
    ImageDrawCircle(dst, centerX, centerY, radius, *color);
}

SHIM void rlshim_ImageDrawCircleV(Image *dst, const Vector2 *center, int radius, const Color *color)
{
    ImageDrawCircleV(dst, *center, radius, *color);
}

SHIM void rlshim_ImageDrawCircleLines(Image *dst, int centerX, int centerY, int radius, const Color *color)
{
    ImageDrawCircleLines(dst, centerX, centerY, radius, *color);
}

SHIM void rlshim_ImageDrawCircleLinesV(Image *dst, const Vector2 *center, int radius, const Color *color)
{
    ImageDrawCircleLinesV(dst, *center, radius, *color);
}

SHIM void rlshim_ImageDrawRectangle(Image *dst, int posX, int posY, int width, int height, const Color *color)
{
    ImageDrawRectangle(dst, posX, posY, width, height, *color);
}

SHIM void rlshim_ImageDrawRectangleV(Image *dst, const Vector2 *position, const Vector2 *size, const Color *color)
{
    ImageDrawRectangleV(dst, *position, *size, *color);
}

SHIM void rlshim_ImageDrawRectangleRec(Image *dst, const Rectangle *rec, const Color *color)
{
    ImageDrawRectangleRec(dst, *rec, *color);
}

SHIM void rlshim_ImageDrawRectangleLines(Image *dst, const Rectangle *rec, int thick, const Color *color)
{
    ImageDrawRectangleLines(dst, *rec, thick, *color);
}

SHIM void rlshim_ImageDrawTriangle(Image *dst, const Vector2 *v1, const Vector2 *v2, const Vector2 *v3, const Color *color)
{
    ImageDrawTriangle(dst, *v1, *v2, *v3, *color);
}

SHIM void rlshim_ImageDrawTriangleEx(Image *dst, const Vector2 *v1, const Vector2 *v2, const Vector2 *v3, const Color *c1, const Color *c2, const Color *c3)
{
    ImageDrawTriangleEx(dst, *v1, *v2, *v3, *c1, *c2, *c3);
}

SHIM void rlshim_ImageDrawTriangleLines(Image *dst, const Vector2 *v1, const Vector2 *v2, const Vector2 *v3, const Color *color)
{
    ImageDrawTriangleLines(dst, *v1, *v2, *v3, *color);
}

SHIM void rlshim_ImageDrawTriangleFan(Image *dst, const Vector2 *points, int pointCount, const Color *color)
{
    ImageDrawTriangleFan(dst, points, pointCount, *color);
}

SHIM void rlshim_ImageDrawTriangleStrip(Image *dst, const Vector2 *points, int pointCount, const Color *color)
{
    ImageDrawTriangleStrip(dst, points, pointCount, *color);
}

SHIM void rlshim_ImageDraw(Image *dst, const Image *src, const Rectangle *srcRec, const Rectangle *dstRec, const Color *tint)
{
    ImageDraw(dst, *src, *srcRec, *dstRec, *tint);
}

SHIM void rlshim_ImageDrawText(Image *dst, const char *text, int posX, int posY, int fontSize, const Color *color)
{
    ImageDrawText(dst, text, posX, posY, fontSize, *color);
}

SHIM void rlshim_ImageDrawTextEx(Image *dst, const Font *font, const char *text, const Vector2 *position, float fontSize, float spacing, const Color *tint)
{
    ImageDrawTextEx(dst, *font, text, *position, fontSize, spacing, *tint);
}

SHIM void rlshim_LoadTexture(const char *fileName, Texture2D *out)
{
    *out = LoadTexture(fileName);
}

SHIM void rlshim_LoadTextureFromImage(const Image *image, Texture2D *out)
{
    *out = LoadTextureFromImage(*image);
}

SHIM void rlshim_LoadTextureCubemap(const Image *image, int layout, TextureCubemap *out)
{
    *out = LoadTextureCubemap(*image, layout);
}

SHIM void rlshim_LoadRenderTexture(int width, int height, RenderTexture2D *out)
{
    *out = LoadRenderTexture(width, height);
}

SHIM bool rlshim_IsTextureValid(const Texture2D *texture)
{
    return IsTextureValid(*texture);
}

SHIM void rlshim_UnloadTexture(const Texture2D *texture)
{
    UnloadTexture(*texture);
}

SHIM bool rlshim_IsRenderTextureValid(const RenderTexture2D *target)
{
    return IsRenderTextureValid(*target);
}

SHIM void rlshim_UnloadRenderTexture(const RenderTexture2D *target)
{
    UnloadRenderTexture(*target);
}

SHIM void rlshim_UpdateTexture(const Texture2D *texture, const void *pixels)
{
    UpdateTexture(*texture, pixels);
}

SHIM void rlshim_UpdateTextureRec(const Texture2D *texture, const Rectangle *rec, const void *pixels)
{
    UpdateTextureRec(*texture, *rec, pixels);
}

SHIM void rlshim_SetTextureFilter(const Texture2D *texture, int filter)
{
    SetTextureFilter(*texture, filter);
}

SHIM void rlshim_SetTextureWrap(const Texture2D *texture, int wrap)
{
    SetTextureWrap(*texture, wrap);
}

SHIM void rlshim_DrawTexture(const Texture2D *texture, int posX, int posY, const Color *tint)
{
    DrawTexture(*texture, posX, posY, *tint);
}

SHIM void rlshim_DrawTextureV(const Texture2D *texture, const Vector2 *position, const Color *tint)
{
    DrawTextureV(*texture, *position, *tint);
}

SHIM void rlshim_DrawTextureEx(const Texture2D *texture, const Vector2 *position, float rotation, float scale, const Color *tint)
{
    DrawTextureEx(*texture, *position, rotation, scale, *tint);
}

SHIM void rlshim_DrawTextureRec(const Texture2D *texture, const Rectangle *source, const Vector2 *position, const Color *tint)
{
    DrawTextureRec(*texture, *source, *position, *tint);
}

SHIM void rlshim_DrawTexturePro(const Texture2D *texture, const Rectangle *source, const Rectangle *dest, const Vector2 *origin, float rotation, const Color *tint)
{
    DrawTexturePro(*texture, *source, *dest, *origin, rotation, *tint);
}

SHIM void rlshim_DrawTextureNPatch(const Texture2D *texture, const NPatchInfo *nPatchInfo, const Rectangle *dest, const Vector2 *origin, float rotation, const Color *tint)
{
    DrawTextureNPatch(*texture, *nPatchInfo, *dest, *origin, rotation, *tint);
}

SHIM bool rlshim_ColorIsEqual(const Color *col1, const Color *col2)
{
    return ColorIsEqual(*col1, *col2);
}

SHIM void rlshim_Fade(const Color *color, float alpha, Color *out)
{
    *out = Fade(*color, alpha);
}

SHIM int rlshim_ColorToInt(const Color *color)
{
    return ColorToInt(*color);
}

SHIM void rlshim_ColorNormalize(const Color *color, Vector4 *out)
{
    *out = ColorNormalize(*color);
}

SHIM void rlshim_ColorFromNormalized(const Vector4 *normalized, Color *out)
{
    *out = ColorFromNormalized(*normalized);
}

SHIM void rlshim_ColorToHSV(const Color *color, Vector3 *out)
{
    *out = ColorToHSV(*color);
}

SHIM void rlshim_ColorFromHSV(float hue, float saturation, float value, Color *out)
{
    *out = ColorFromHSV(hue, saturation, value);
}

SHIM void rlshim_ColorTint(const Color *color, const Color *tint, Color *out)
{
    *out = ColorTint(*color, *tint);
}

SHIM void rlshim_ColorBrightness(const Color *color, float factor, Color *out)
{
    *out = ColorBrightness(*color, factor);
}

SHIM void rlshim_ColorContrast(const Color *color, float contrast, Color *out)
{
    *out = ColorContrast(*color, contrast);
}

SHIM void rlshim_ColorAlpha(const Color *color, float alpha, Color *out)
{
    *out = ColorAlpha(*color, alpha);
}

SHIM void rlshim_ColorAlphaBlend(const Color *dst, const Color *src, const Color *tint, Color *out)
{
    *out = ColorAlphaBlend(*dst, *src, *tint);
}

SHIM void rlshim_ColorLerp(const Color *color1, const Color *color2, float factor, Color *out)
{
    *out = ColorLerp(*color1, *color2, factor);
}

SHIM void rlshim_GetColor(unsigned int hexValue, Color *out)
{
    *out = GetColor(hexValue);
}

SHIM void rlshim_GetPixelColor(void *srcPtr, int format, Color *out)
{
    *out = GetPixelColor(srcPtr, format);
}

SHIM void rlshim_SetPixelColor(void *dstPtr, const Color *color, int format)
{
    SetPixelColor(dstPtr, *color, format);
}

SHIM void rlshim_GetFontDefault(Font *out)
{
    *out = GetFontDefault();
}

SHIM void rlshim_LoadFont(const char *fileName, Font *out)
{
    *out = LoadFont(fileName);
}

SHIM void rlshim_LoadFontEx(const char *fileName, int fontSize, const int *codepoints, int codepointCount, Font *out)
{
    *out = LoadFontEx(fileName, fontSize, codepoints, codepointCount);
}

SHIM void rlshim_LoadFontFromImage(const Image *image, const Color *key, int firstChar, Font *out)
{
    *out = LoadFontFromImage(*image, *key, firstChar);
}

SHIM void rlshim_LoadFontFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int fontSize, const int *codepoints, int codepointCount, Font *out)
{
    *out = LoadFontFromMemory(fileType, fileData, dataSize, fontSize, codepoints, codepointCount);
}

SHIM bool rlshim_IsFontValid(const Font *font)
{
    return IsFontValid(*font);
}

SHIM void rlshim_GenImageFontAtlas(const GlyphInfo *glyphs, Rectangle **glyphRecs, int glyphCount, int fontSize, int padding, int packMethod, Image *out)
{
    *out = GenImageFontAtlas(glyphs, glyphRecs, glyphCount, fontSize, padding, packMethod);
}

SHIM void rlshim_UnloadFont(const Font *font)
{
    UnloadFont(*font);
}

SHIM bool rlshim_ExportFontAsCode(const Font *font, const char *fileName)
{
    return ExportFontAsCode(*font, fileName);
}

SHIM void rlshim_DrawText(const char *text, int posX, int posY, int fontSize, const Color *color)
{
    DrawText(text, posX, posY, fontSize, *color);
}

SHIM void rlshim_DrawTextEx(const Font *font, const char *text, const Vector2 *position, float fontSize, float spacing, const Color *tint)
{
    DrawTextEx(*font, text, *position, fontSize, spacing, *tint);
}

SHIM void rlshim_DrawTextPro(const Font *font, const char *text, const Vector2 *position, const Vector2 *origin, float rotation, float fontSize, float spacing, const Color *tint)
{
    DrawTextPro(*font, text, *position, *origin, rotation, fontSize, spacing, *tint);
}

SHIM void rlshim_DrawTextCodepoint(const Font *font, int codepoint, const Vector2 *position, float fontSize, const Color *tint)
{
    DrawTextCodepoint(*font, codepoint, *position, fontSize, *tint);
}

SHIM void rlshim_DrawTextCodepoints(const Font *font, const int *codepoints, int codepointCount, const Vector2 *position, float fontSize, float spacing, const Color *tint)
{
    DrawTextCodepoints(*font, codepoints, codepointCount, *position, fontSize, spacing, *tint);
}

SHIM void rlshim_MeasureTextEx(const Font *font, const char *text, float fontSize, float spacing, Vector2 *out)
{
    *out = MeasureTextEx(*font, text, fontSize, spacing);
}

SHIM void rlshim_MeasureTextCodepoints(const Font *font, const int *codepoints, int length, float fontSize, float spacing, Vector2 *out)
{
    *out = MeasureTextCodepoints(*font, codepoints, length, fontSize, spacing);
}

SHIM int rlshim_GetGlyphIndex(const Font *font, int codepoint)
{
    return GetGlyphIndex(*font, codepoint);
}

SHIM void rlshim_GetGlyphInfo(const Font *font, int codepoint, GlyphInfo *out)
{
    *out = GetGlyphInfo(*font, codepoint);
}

SHIM void rlshim_GetGlyphAtlasRec(const Font *font, int codepoint, Rectangle *out)
{
    *out = GetGlyphAtlasRec(*font, codepoint);
}

SHIM void rlshim_DrawLine3D(const Vector3 *startPos, const Vector3 *endPos, const Color *color)
{
    DrawLine3D(*startPos, *endPos, *color);
}

SHIM void rlshim_DrawPoint3D(const Vector3 *position, const Color *color)
{
    DrawPoint3D(*position, *color);
}

SHIM void rlshim_DrawCircle3D(const Vector3 *center, float radius, const Vector3 *rotationAxis, float rotationAngle, const Color *color)
{
    DrawCircle3D(*center, radius, *rotationAxis, rotationAngle, *color);
}

SHIM void rlshim_DrawTriangle3D(const Vector3 *v1, const Vector3 *v2, const Vector3 *v3, const Color *color)
{
    DrawTriangle3D(*v1, *v2, *v3, *color);
}

SHIM void rlshim_DrawTriangleStrip3D(const Vector3 *points, int pointCount, const Color *color)
{
    DrawTriangleStrip3D(points, pointCount, *color);
}

SHIM void rlshim_DrawCube(const Vector3 *position, float width, float height, float length, const Color *color)
{
    DrawCube(*position, width, height, length, *color);
}

SHIM void rlshim_DrawCubeV(const Vector3 *position, const Vector3 *size, const Color *color)
{
    DrawCubeV(*position, *size, *color);
}

SHIM void rlshim_DrawCubeWires(const Vector3 *position, float width, float height, float length, const Color *color)
{
    DrawCubeWires(*position, width, height, length, *color);
}

SHIM void rlshim_DrawCubeWiresV(const Vector3 *position, const Vector3 *size, const Color *color)
{
    DrawCubeWiresV(*position, *size, *color);
}

SHIM void rlshim_DrawSphere(const Vector3 *centerPos, float radius, const Color *color)
{
    DrawSphere(*centerPos, radius, *color);
}

SHIM void rlshim_DrawSphereEx(const Vector3 *centerPos, float radius, int rings, int slices, const Color *color)
{
    DrawSphereEx(*centerPos, radius, rings, slices, *color);
}

SHIM void rlshim_DrawSphereWires(const Vector3 *centerPos, float radius, int rings, int slices, const Color *color)
{
    DrawSphereWires(*centerPos, radius, rings, slices, *color);
}

SHIM void rlshim_DrawCylinder(const Vector3 *position, float radiusTop, float radiusBottom, float height, int slices, const Color *color)
{
    DrawCylinder(*position, radiusTop, radiusBottom, height, slices, *color);
}

SHIM void rlshim_DrawCylinderEx(const Vector3 *startPos, const Vector3 *endPos, float startRadius, float endRadius, int sides, const Color *color)
{
    DrawCylinderEx(*startPos, *endPos, startRadius, endRadius, sides, *color);
}

SHIM void rlshim_DrawCylinderWires(const Vector3 *position, float radiusTop, float radiusBottom, float height, int slices, const Color *color)
{
    DrawCylinderWires(*position, radiusTop, radiusBottom, height, slices, *color);
}

SHIM void rlshim_DrawCylinderWiresEx(const Vector3 *startPos, const Vector3 *endPos, float startRadius, float endRadius, int sides, const Color *color)
{
    DrawCylinderWiresEx(*startPos, *endPos, startRadius, endRadius, sides, *color);
}

SHIM void rlshim_DrawCapsule(const Vector3 *startPos, const Vector3 *endPos, float radius, int slices, int rings, const Color *color)
{
    DrawCapsule(*startPos, *endPos, radius, slices, rings, *color);
}

SHIM void rlshim_DrawCapsuleWires(const Vector3 *startPos, const Vector3 *endPos, float radius, int slices, int rings, const Color *color)
{
    DrawCapsuleWires(*startPos, *endPos, radius, slices, rings, *color);
}

SHIM void rlshim_DrawPlane(const Vector3 *centerPos, const Vector2 *size, const Color *color)
{
    DrawPlane(*centerPos, *size, *color);
}

SHIM void rlshim_DrawRay(const Ray *ray, const Color *color)
{
    DrawRay(*ray, *color);
}

SHIM void rlshim_LoadModel(const char *fileName, Model *out)
{
    *out = LoadModel(fileName);
}

SHIM void rlshim_LoadModelFromMesh(const Mesh *mesh, Model *out)
{
    *out = LoadModelFromMesh(*mesh);
}

SHIM bool rlshim_IsModelValid(const Model *model)
{
    return IsModelValid(*model);
}

SHIM void rlshim_UnloadModel(const Model *model)
{
    UnloadModel(*model);
}

SHIM void rlshim_GetModelBoundingBox(const Model *model, BoundingBox *out)
{
    *out = GetModelBoundingBox(*model);
}

SHIM void rlshim_DrawModel(const Model *model, const Vector3 *position, float scale, const Color *tint)
{
    DrawModel(*model, *position, scale, *tint);
}

SHIM void rlshim_DrawModelEx(const Model *model, const Vector3 *position, const Vector3 *rotationAxis, float rotationAngle, const Vector3 *scale, const Color *tint)
{
    DrawModelEx(*model, *position, *rotationAxis, rotationAngle, *scale, *tint);
}

SHIM void rlshim_DrawModelWires(const Model *model, const Vector3 *position, float scale, const Color *tint)
{
    DrawModelWires(*model, *position, scale, *tint);
}

SHIM void rlshim_DrawModelWiresEx(const Model *model, const Vector3 *position, const Vector3 *rotationAxis, float rotationAngle, const Vector3 *scale, const Color *tint)
{
    DrawModelWiresEx(*model, *position, *rotationAxis, rotationAngle, *scale, *tint);
}

SHIM void rlshim_DrawBoundingBox(const BoundingBox *box, const Color *color)
{
    DrawBoundingBox(*box, *color);
}

SHIM void rlshim_DrawBillboard(const Camera *camera, const Texture2D *texture, const Vector3 *position, float scale, const Color *tint)
{
    DrawBillboard(*camera, *texture, *position, scale, *tint);
}

SHIM void rlshim_DrawBillboardRec(const Camera *camera, const Texture2D *texture, const Rectangle *source, const Vector3 *position, const Vector2 *size, const Color *tint)
{
    DrawBillboardRec(*camera, *texture, *source, *position, *size, *tint);
}

SHIM void rlshim_DrawBillboardPro(const Camera *camera, const Texture2D *texture, const Rectangle *source, const Vector3 *position, const Vector3 *up, const Vector2 *size, const Vector2 *origin, float rotation, const Color *tint)
{
    DrawBillboardPro(*camera, *texture, *source, *position, *up, *size, *origin, rotation, *tint);
}

SHIM void rlshim_UpdateMeshBuffer(const Mesh *mesh, int index, const void *data, int dataSize, int offset)
{
    UpdateMeshBuffer(*mesh, index, data, dataSize, offset);
}

SHIM void rlshim_UnloadMesh(const Mesh *mesh)
{
    UnloadMesh(*mesh);
}

SHIM void rlshim_DrawMesh(const Mesh *mesh, const Material *material, const Matrix *transform)
{
    DrawMesh(*mesh, *material, *transform);
}

SHIM void rlshim_DrawMeshInstanced(const Mesh *mesh, const Material *material, const Matrix *transforms, int instances)
{
    DrawMeshInstanced(*mesh, *material, transforms, instances);
}

SHIM void rlshim_GetMeshBoundingBox(const Mesh *mesh, BoundingBox *out)
{
    *out = GetMeshBoundingBox(*mesh);
}

SHIM bool rlshim_ExportMesh(const Mesh *mesh, const char *fileName)
{
    return ExportMesh(*mesh, fileName);
}

SHIM bool rlshim_ExportMeshAsCode(const Mesh *mesh, const char *fileName)
{
    return ExportMeshAsCode(*mesh, fileName);
}

SHIM void rlshim_GenMeshPoly(int sides, float radius, Mesh *out)
{
    *out = GenMeshPoly(sides, radius);
}

SHIM void rlshim_GenMeshPlane(float width, float length, int resX, int resZ, Mesh *out)
{
    *out = GenMeshPlane(width, length, resX, resZ);
}

SHIM void rlshim_GenMeshCube(float width, float height, float length, Mesh *out)
{
    *out = GenMeshCube(width, height, length);
}

SHIM void rlshim_GenMeshSphere(float radius, int rings, int slices, Mesh *out)
{
    *out = GenMeshSphere(radius, rings, slices);
}

SHIM void rlshim_GenMeshHemiSphere(float radius, int rings, int slices, Mesh *out)
{
    *out = GenMeshHemiSphere(radius, rings, slices);
}

SHIM void rlshim_GenMeshCylinder(float radius, float height, int slices, Mesh *out)
{
    *out = GenMeshCylinder(radius, height, slices);
}

SHIM void rlshim_GenMeshCone(float radius, float height, int slices, Mesh *out)
{
    *out = GenMeshCone(radius, height, slices);
}

SHIM void rlshim_GenMeshTorus(float radius, float size, int radSeg, int sides, Mesh *out)
{
    *out = GenMeshTorus(radius, size, radSeg, sides);
}

SHIM void rlshim_GenMeshKnot(float radius, float size, int radSeg, int sides, Mesh *out)
{
    *out = GenMeshKnot(radius, size, radSeg, sides);
}

SHIM void rlshim_GenMeshHeightmap(const Image *heightmap, const Vector3 *size, Mesh *out)
{
    *out = GenMeshHeightmap(*heightmap, *size);
}

SHIM void rlshim_GenMeshCubicmap(const Image *cubicmap, const Vector3 *cubeSize, Mesh *out)
{
    *out = GenMeshCubicmap(*cubicmap, *cubeSize);
}

SHIM void rlshim_LoadMaterialDefault(Material *out)
{
    *out = LoadMaterialDefault();
}

SHIM bool rlshim_IsMaterialValid(const Material *material)
{
    return IsMaterialValid(*material);
}

SHIM void rlshim_UnloadMaterial(const Material *material)
{
    UnloadMaterial(*material);
}

SHIM void rlshim_SetMaterialTexture(Material *material, int mapType, const Texture2D *texture)
{
    SetMaterialTexture(material, mapType, *texture);
}

SHIM void rlshim_UpdateModelAnimation(const Model *model, const ModelAnimation *anim, float frame)
{
    UpdateModelAnimation(*model, *anim, frame);
}

SHIM void rlshim_UpdateModelAnimationEx(const Model *model, const ModelAnimation *animA, float frameA, const ModelAnimation *animB, float frameB, float blend)
{
    UpdateModelAnimationEx(*model, *animA, frameA, *animB, frameB, blend);
}

SHIM bool rlshim_IsModelAnimationValid(const Model *model, const ModelAnimation *anim)
{
    return IsModelAnimationValid(*model, *anim);
}

SHIM bool rlshim_CheckCollisionSpheres(const Vector3 *center1, float radius1, const Vector3 *center2, float radius2)
{
    return CheckCollisionSpheres(*center1, radius1, *center2, radius2);
}

SHIM bool rlshim_CheckCollisionBoxes(const BoundingBox *box1, const BoundingBox *box2)
{
    return CheckCollisionBoxes(*box1, *box2);
}

SHIM bool rlshim_CheckCollisionBoxSphere(const BoundingBox *box, const Vector3 *center, float radius)
{
    return CheckCollisionBoxSphere(*box, *center, radius);
}

SHIM void rlshim_GetRayCollisionSphere(const Ray *ray, const Vector3 *center, float radius, RayCollision *out)
{
    *out = GetRayCollisionSphere(*ray, *center, radius);
}

SHIM void rlshim_GetRayCollisionBox(const Ray *ray, const BoundingBox *box, RayCollision *out)
{
    *out = GetRayCollisionBox(*ray, *box);
}

SHIM void rlshim_GetRayCollisionMesh(const Ray *ray, const Mesh *mesh, const Matrix *transform, RayCollision *out)
{
    *out = GetRayCollisionMesh(*ray, *mesh, *transform);
}

SHIM void rlshim_GetRayCollisionTriangle(const Ray *ray, const Vector3 *p1, const Vector3 *p2, const Vector3 *p3, RayCollision *out)
{
    *out = GetRayCollisionTriangle(*ray, *p1, *p2, *p3);
}

SHIM void rlshim_GetRayCollisionQuad(const Ray *ray, const Vector3 *p1, const Vector3 *p2, const Vector3 *p3, const Vector3 *p4, RayCollision *out)
{
    *out = GetRayCollisionQuad(*ray, *p1, *p2, *p3, *p4);
}

SHIM void rlshim_LoadWave(const char *fileName, Wave *out)
{
    *out = LoadWave(fileName);
}

SHIM void rlshim_LoadWaveFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, Wave *out)
{
    *out = LoadWaveFromMemory(fileType, fileData, dataSize);
}

SHIM bool rlshim_IsWaveValid(const Wave *wave)
{
    return IsWaveValid(*wave);
}

SHIM void rlshim_LoadSound(const char *fileName, Sound *out)
{
    *out = LoadSound(fileName);
}

SHIM void rlshim_LoadSoundFromWave(const Wave *wave, Sound *out)
{
    *out = LoadSoundFromWave(*wave);
}

SHIM void rlshim_LoadSoundAlias(const Sound *source, Sound *out)
{
    *out = LoadSoundAlias(*source);
}

SHIM bool rlshim_IsSoundValid(const Sound *sound)
{
    return IsSoundValid(*sound);
}

SHIM void rlshim_UpdateSound(const Sound *sound, const void *data, int sampleCount)
{
    UpdateSound(*sound, data, sampleCount);
}

SHIM void rlshim_UnloadWave(const Wave *wave)
{
    UnloadWave(*wave);
}

SHIM void rlshim_UnloadSound(const Sound *sound)
{
    UnloadSound(*sound);
}

SHIM void rlshim_UnloadSoundAlias(const Sound *alias)
{
    UnloadSoundAlias(*alias);
}

SHIM bool rlshim_ExportWave(const Wave *wave, const char *fileName)
{
    return ExportWave(*wave, fileName);
}

SHIM bool rlshim_ExportWaveAsCode(const Wave *wave, const char *fileName)
{
    return ExportWaveAsCode(*wave, fileName);
}

SHIM void rlshim_PlaySound(const Sound *sound)
{
    PlaySound(*sound);
}

SHIM void rlshim_StopSound(const Sound *sound)
{
    StopSound(*sound);
}

SHIM void rlshim_PauseSound(const Sound *sound)
{
    PauseSound(*sound);
}

SHIM void rlshim_ResumeSound(const Sound *sound)
{
    ResumeSound(*sound);
}

SHIM bool rlshim_IsSoundPlaying(const Sound *sound)
{
    return IsSoundPlaying(*sound);
}

SHIM void rlshim_SetSoundVolume(const Sound *sound, float volume)
{
    SetSoundVolume(*sound, volume);
}

SHIM void rlshim_SetSoundPitch(const Sound *sound, float pitch)
{
    SetSoundPitch(*sound, pitch);
}

SHIM void rlshim_SetSoundPan(const Sound *sound, float pan)
{
    SetSoundPan(*sound, pan);
}

SHIM void rlshim_WaveCopy(const Wave *wave, Wave *out)
{
    *out = WaveCopy(*wave);
}

SHIM float * rlshim_LoadWaveSamples(const Wave *wave)
{
    return LoadWaveSamples(*wave);
}

SHIM void rlshim_LoadMusicStream(const char *fileName, Music *out)
{
    *out = LoadMusicStream(fileName);
}

SHIM void rlshim_LoadMusicStreamFromMemory(const char *fileType, const unsigned char *data, int dataSize, Music *out)
{
    *out = LoadMusicStreamFromMemory(fileType, data, dataSize);
}

SHIM bool rlshim_IsMusicValid(const Music *music)
{
    return IsMusicValid(*music);
}

SHIM void rlshim_UnloadMusicStream(const Music *music)
{
    UnloadMusicStream(*music);
}

SHIM void rlshim_PlayMusicStream(const Music *music)
{
    PlayMusicStream(*music);
}

SHIM bool rlshim_IsMusicStreamPlaying(const Music *music)
{
    return IsMusicStreamPlaying(*music);
}

SHIM void rlshim_UpdateMusicStream(const Music *music)
{
    UpdateMusicStream(*music);
}

SHIM void rlshim_StopMusicStream(const Music *music)
{
    StopMusicStream(*music);
}

SHIM void rlshim_PauseMusicStream(const Music *music)
{
    PauseMusicStream(*music);
}

SHIM void rlshim_ResumeMusicStream(const Music *music)
{
    ResumeMusicStream(*music);
}

SHIM void rlshim_SeekMusicStream(const Music *music, float position)
{
    SeekMusicStream(*music, position);
}

SHIM void rlshim_SetMusicVolume(const Music *music, float volume)
{
    SetMusicVolume(*music, volume);
}

SHIM void rlshim_SetMusicPitch(const Music *music, float pitch)
{
    SetMusicPitch(*music, pitch);
}

SHIM void rlshim_SetMusicPan(const Music *music, float pan)
{
    SetMusicPan(*music, pan);
}

SHIM float rlshim_GetMusicTimeLength(const Music *music)
{
    return GetMusicTimeLength(*music);
}

SHIM float rlshim_GetMusicTimePlayed(const Music *music)
{
    return GetMusicTimePlayed(*music);
}

SHIM void rlshim_LoadAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels, AudioStream *out)
{
    *out = LoadAudioStream(sampleRate, sampleSize, channels);
}

SHIM bool rlshim_IsAudioStreamValid(const AudioStream *stream)
{
    return IsAudioStreamValid(*stream);
}

SHIM void rlshim_UnloadAudioStream(const AudioStream *stream)
{
    UnloadAudioStream(*stream);
}

SHIM void rlshim_UpdateAudioStream(const AudioStream *stream, const void *data, int frameCount)
{
    UpdateAudioStream(*stream, data, frameCount);
}

SHIM bool rlshim_IsAudioStreamProcessed(const AudioStream *stream)
{
    return IsAudioStreamProcessed(*stream);
}

SHIM void rlshim_PlayAudioStream(const AudioStream *stream)
{
    PlayAudioStream(*stream);
}

SHIM void rlshim_PauseAudioStream(const AudioStream *stream)
{
    PauseAudioStream(*stream);
}

SHIM void rlshim_ResumeAudioStream(const AudioStream *stream)
{
    ResumeAudioStream(*stream);
}

SHIM bool rlshim_IsAudioStreamPlaying(const AudioStream *stream)
{
    return IsAudioStreamPlaying(*stream);
}

SHIM void rlshim_StopAudioStream(const AudioStream *stream)
{
    StopAudioStream(*stream);
}

SHIM void rlshim_SetAudioStreamVolume(const AudioStream *stream, float volume)
{
    SetAudioStreamVolume(*stream, volume);
}

SHIM void rlshim_SetAudioStreamPitch(const AudioStream *stream, float pitch)
{
    SetAudioStreamPitch(*stream, pitch);
}

SHIM void rlshim_SetAudioStreamPan(const AudioStream *stream, float pan)
{
    SetAudioStreamPan(*stream, pan);
}

SHIM void rlshim_SetAudioStreamCallback(const AudioStream *stream, AudioCallback callback)
{
    SetAudioStreamCallback(*stream, callback);
}

SHIM void rlshim_AttachAudioStreamProcessor(const AudioStream *stream, AudioCallback processor)
{
    AttachAudioStreamProcessor(*stream, processor);
}

SHIM void rlshim_DetachAudioStreamProcessor(const AudioStream *stream, AudioCallback processor)
{
    DetachAudioStreamProcessor(*stream, processor);
}
