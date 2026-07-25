Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00DB37C106
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 03:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949542; cv=none; b=fU+971s8PMGBMpSY1yUl4FUoye/mZ7on4m2ASZZJDQZG/tskEIjtT6E62Ljo2lHE6Iywl43beJ4gqIR146HfuAr3xe72FvOd/+PTFUX5O3R/KrXrWd/tDKSzUbDHLD0/XqYevUPq60QbxcGI9jw21RKvI++8d8Yk/KzTmARmDcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949542; c=relaxed/simple;
	bh=YS1hsBOLAQ7oWGJy4HGO+rqgDHn9Jl4BFLeWRFyCA3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TuRBaxrbuyZP6EVQxgHdHlkz8vMwGQI+6TV1dsVCr+4iKWU/h9OoxD2wPClfiUHXGiwwdd7dtHWQVaFfQaei9npX1547WjZTZ+jSsKmCeNjx2BXO/37uqjCLK1ui292biwjj3lnWm0WH3M/BYCgylQnnOL4qNsRuwxIWOpgf7E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qO6NdLc7; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qO6NdLc7"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-c8c1ebd68a1so683188a12.0
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 20:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949530; x=1785554330; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62YcKoWbwf7Xh2pmJjiLRuJIzfIQtFYxUsfYj2T/BQY=;
        b=qO6NdLc7hJ0RWZQ3FtFqSOCtErg58Fqj2o7WSUMb4dzkOoaJdNr0U2d7C1PS5rEeRu
         P2DhUGiInKyZOli0CxTzrMiKIJl+eWCkUQYuyBmEKiGBKWbSEl2cySNIAq7J/Tplo4lR
         Wuoz8H34S8k5B/HPo9XQfaJ2MMnvUBXr7xsuTe/mVXDgD13gyPRUvS9rwNmgLrZfO3U7
         0zpJDcMqnyhBHYgRNApIFhhjduDt3FtY4kyzCsXlwf125rNPXm2rNBzzetIQX4gKn0as
         St279stZEqx0/sfSl23+WiFPqomm4jjvckRZVZKy36YlAiXvalgU6TTqYWflUiyP73Al
         /n3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949530; x=1785554330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62YcKoWbwf7Xh2pmJjiLRuJIzfIQtFYxUsfYj2T/BQY=;
        b=JPOfInA34PSOt2sNy2zPlvcvz3qyuV0DyBNJ8P6dDkiiSVIdDDV/x1/I8+60v5D4ud
         VVGvrDSN6EOLTEwRE8F2K8g4rpZHea/BObwxqvnSbb/vsPcMK0r6tnSTrX5x6q6dMUQ9
         F7xsrwoHCrhDNxm8gDuWJEBYMo7B9yHcr6FP+WNva/fufOilhO0/emuPNyppSRF52wew
         BPLYnj9r063ZNzJk7HWhhGl9WuQPbxTN119si+OMDkpa0PsbpqACf/6RMZp6XyoXTC6B
         QYzEgtnD8Rnv3/DXM07YLHmFrfbOyPjH1dGGrbZjkwLWFU7jxEDtf67hujUV+42EsomG
         5CGg==
X-Forwarded-Encrypted: i=1; AHgh+RrbVRFC4pe+iY/CLZU7lvbD7mE3wJ8wWqbwC2eIO0DES+H3MwVAme3hCSi60ZJsNWF1GAL7Zy1GWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQUsLU+qL3SWH/R0O4782n9AMiRL1p5IGT4MJenpHGZWkODXwG
	KS/e3dCmLz8ss1Bb0Y59VwRbW87q6rD3VGDjGpWKxOOflFaqm5kGx9Y3
X-Gm-Gg: AR+sD10L+X3k+3k1+osgjMYKVuCRKeSF3tp138t/1m3KP8qz4N+n10aza315Tu+DRsR
	7KzliekZjUaYdM8Ne5FVOvyltSndBQdS9WC7CMZLqxlY7IerxsuXyw7/UR7pLxiQ1olvFMax9SA
	xkce9UlMmvxKNT0eEwuPsaan/jHR7cidr3TxrciIbV2HHDkpc/AUsIE9mlnWm4nRCdQzPNUL18k
	LDo6W5shIgj9aYtF6EpEtq7/dxvRHxc7oKl9G5WNlNR5fZtzkZtkkuIU03a71wD6PrO3eoHNtt8
	9LSUFcEl4KVVcjD1zQwSfVdJLh128Aw4vRnLTTU3phz6dXUwJxVWvXF/Nn3YGg8EXbKwGWs7lRV
	fKc8mPpoXQ8enLV+0H4mz1QK7kc1ZrScDyi3hYcbSXay1LDAGavP/h7M=
X-Received: by 2002:a05:6a00:4291:b0:84e:1a34:2470 with SMTP id d2e1a72fcca58-84e5949a18bmr638140b3a.30.1784949529988;
        Fri, 24 Jul 2026 20:18:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:18:48 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:43 -0400
Subject: [PATCH 11/17] drm/spacemit: add Saturn DPU DRM device driver
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-11-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

Add the DRM device for the SpacemiT K3 Saturn display processing unit
and hook the driver up to the build. The SoC has two DPU instances;
each drives one CRTC that scans out a single primary plane in linear
RGB at up to 3840x2160@60 and feeds a downstream DP/eDP controller
over an OF-graph endpoint. Buffers use drm_gem_shmem_helper. The
AFBC/compressed decode path is not exposed and writeback is not
implemented.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 drivers/gpu/drm/Kconfig                 |   1 +
 drivers/gpu/drm/Makefile                |   1 +
 drivers/gpu/drm/spacemit/Kconfig        |  18 +++++
 drivers/gpu/drm/spacemit/Makefile       |  12 +++
 drivers/gpu/drm/spacemit/spacemit_drm.c | 132 ++++++++++++++++++++++++++++++++
 5 files changed, 164 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 323422861e8f..81081562a6da 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -341,6 +341,7 @@ source "drivers/gpu/drm/renesas/Kconfig"
 source "drivers/gpu/drm/rockchip/Kconfig"
 source "drivers/gpu/drm/sitronix/Kconfig"
 source "drivers/gpu/drm/solomon/Kconfig"
+source "drivers/gpu/drm/spacemit/Kconfig"
 source "drivers/gpu/drm/sprd/Kconfig"
 source "drivers/gpu/drm/sti/Kconfig"
 source "drivers/gpu/drm/stm/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index e97faabcd783..4a105520ee91 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -204,6 +204,7 @@ obj-$(CONFIG_DRM_MSM) += msm/
 obj-$(CONFIG_DRM_TEGRA) += tegra/
 obj-$(CONFIG_DRM_STM) += stm/
 obj-$(CONFIG_DRM_STI) += sti/
+obj-$(CONFIG_DRM_SPACEMIT) += spacemit/
 obj-y 			+= imx/
 obj-$(CONFIG_DRM_INGENIC) += ingenic/
 obj-$(CONFIG_DRM_LOGICVC) += logicvc/
diff --git a/drivers/gpu/drm/spacemit/Kconfig b/drivers/gpu/drm/spacemit/Kconfig
new file mode 100644
index 000000000000..51e38dabfdba
--- /dev/null
+++ b/drivers/gpu/drm/spacemit/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config DRM_SPACEMIT
+	tristate "DRM support for SpacemiT display controllers"
+	depends on DRM && OF && MMU
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_SHMEM_HELPER
+	select REGMAP_MMIO
+	select VIDEOMODE_HELPERS
+	help
+	  Choose this option if you have a SpacemiT SoC with the Saturn
+	  display processing unit, such as the K3. The DPU scans out
+	  framebuffers through its private display MMU and feeds a
+	  DisplayPort or embedded DisplayPort controller.
+
+	  If M is selected the module will be called spacemit-drm.
diff --git a/drivers/gpu/drm/spacemit/Makefile b/drivers/gpu/drm/spacemit/Makefile
new file mode 100644
index 000000000000..b3b148000cf7
--- /dev/null
+++ b/drivers/gpu/drm/spacemit/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+
+spacemit-drm-y := spacemit_drm.o \
+		  spacemit_crtc.o \
+		  spacemit_cmdlist.o \
+		  spacemit_planes.o \
+		  spacemit_dmmu.o \
+		  dpu/dpu_saturn.o \
+		  dpu/dpu_saturn_hee.o \
+		  dpu/saturn_fbcmem.o
+
+obj-$(CONFIG_DRM_SPACEMIT) += spacemit-drm.o
diff --git a/drivers/gpu/drm/spacemit/spacemit_drm.c b/drivers/gpu/drm/spacemit/spacemit_drm.c
new file mode 100644
index 000000000000..9fb6a7661b48
--- /dev/null
+++ b/drivers/gpu/drm/spacemit/spacemit_drm.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025-2026 SpacemiT Co., Ltd.
+ *
+ */
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_of.h>
+#include <drm/drm_fbdev_shmem.h>
+#include <linux/component.h>
+#include <linux/of_graph.h>
+
+#include "spacemit_drm.h"
+#include "spacemit_crtc.h"
+
+#define DRIVER_NAME	"spacemit"
+#define DRIVER_DESC	"SpacemiT SoC DRM driver"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+static void spacemit_drm_atomic_commit_tail(struct drm_atomic_commit *old_state)
+{
+	struct drm_device *dev = old_state->dev;
+
+	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+
+	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+
+	drm_atomic_helper_commit_planes(dev, old_state,
+					DRM_PLANE_COMMIT_ACTIVE_ONLY);
+
+	drm_atomic_helper_wait_for_flip_done(dev, old_state);
+
+	drm_atomic_helper_commit_hw_done(old_state);
+
+	drm_atomic_helper_cleanup_planes(dev, old_state);
+}
+
+static const struct drm_mode_config_helper_funcs spacemit_drm_mode_config_helper = {
+	.atomic_commit_tail = spacemit_drm_atomic_commit_tail,
+};
+
+static const struct drm_mode_config_funcs spacemit_drm_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+int spacemit_drm_mode_config_init(struct drm_device *drm)
+{
+	int ret;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	drm->mode_config.min_width = 1;
+	drm->mode_config.min_height = 1;
+	/* K3 user manual: each DPU scans out at most 3840x2160@60 */
+	drm->mode_config.max_width = 3840;
+	drm->mode_config.max_height = 2160;
+
+	drm->mode_config.funcs = &spacemit_drm_mode_config_funcs;
+	drm->mode_config.helper_private = &spacemit_drm_mode_config_helper;
+
+	return 0;
+}
+
+DEFINE_DRM_GEM_FOPS(spacemit_drm_fops);
+
+struct drm_driver spacemit_drm_drv = {
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops = &spacemit_drm_fops,
+
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
+
+	.name		= DRIVER_NAME,
+	.desc		= DRIVER_DESC,
+	.major		= DRIVER_MAJOR,
+	.minor		= DRIVER_MINOR,
+};
+
+static int compare_of(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+int spacemit_drm_of_component_probe(struct device *dev)
+{
+	struct device_node *ports, *port, *ep;
+	struct device_node *remote;
+	struct component_match *match = NULL;
+
+	if (!dev->of_node)
+		return -EINVAL;
+
+	/* The DPU is the drm root: its OF graph names the DP/eDP components. */
+	ports = of_get_child_by_name(dev->of_node, "ports");
+	if (!ports) {
+		dev_err(dev, "missing 'ports' child node\n");
+		return -EINVAL;
+	}
+
+	for_each_child_of_node(ports, port) {
+		if (!of_node_name_eq(port, "port"))
+			continue;
+		for_each_child_of_node(port, ep) {
+			if (!of_node_name_eq(ep, "endpoint"))
+				continue;
+			remote = of_graph_get_remote_port_parent(ep);
+			if (!remote)
+				continue;
+			if (of_device_is_available(remote))
+				drm_of_component_match_add(dev, &match,
+							   compare_of, remote);
+			of_node_put(remote);
+		}
+	}
+	of_node_put(ports);
+
+	if (!match) {
+		dev_err(dev, "no downstream component available\n");
+		return -ENODEV;
+	}
+
+	return component_master_add_with_match(dev, &spacemit_drm_master_ops,
+					       match);
+}

-- 
2.43.0

