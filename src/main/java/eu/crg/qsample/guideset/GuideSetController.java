package eu.crg.qsample.guideset;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import eu.crg.qsample.file.File;
import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabFile;


@RestController
@RequestMapping("/api/guideset")
public class GuideSetController {

    @Autowired
    GuideSetService guideSetService;


    @PostMapping("/set/{wetlabApiKey}")
    @PreAuthorize("hasRole('INTERNAL')")
    public GuideSet setGuideset (@PathVariable UUID wetlabApiKey, @RequestBody List<WetLabFile> files) {
        return guideSetService.setGuideset(wetlabApiKey, files);
    }

    @PostMapping("/delete")
    @PreAuthorize("hasRole('INTERNAL')")
    public boolean deleteGuideset (@RequestBody GuideSet guideSet) {
        return guideSetService.deleteGuideset(guideSet);
    }

    @GetMapping("/getByWetLabApiKey/{wetlabApiKey}")
    @PreAuthorize("hasRole('INTERNAL')")
    public GuideSet getGuidesetByWetlabApiKey (@PathVariable UUID wetlabApiKey) {
        return guideSetService.getGuidesetByWetlabApiKey(wetlabApiKey);
    }





}