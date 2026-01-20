Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212A3ECBC6
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907471; cv=none; b=eKa1jaywp3jUUD8iMWNywG1VtTEv2aK9XZQOiCkkBzmfCZ1TfgiCkZravBJS7VFtDuK8uPCoFw00q73PuBS9oVZPBQxFvQDpPMYjxUbRDCOn7YXCxJJ0Mk4aVHFWPbdIQOnv5Ol7pbC8jYkRmVoL0K7wVWIw5oOtvs5wdQfXKqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907471; c=relaxed/simple;
	bh=cY/d2I/Kt0ylqYIDhKML6y6aDVTO/HHtkuI9wBxPxHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aRg5tgU6eR0khchrmTewZdJ4M0i6EALn57qi/OlLR60YxMJoGOGdDhXC3C8gn8lehivJPPXI5Kx1PJ4d2r5HWJz1gMN1YrbYsGAN+WPbQ57T3uuB16LNUtyYRGafwYS/EXbo7ZYlaWGTWLl9BzuHT3VycVc+1L5GdENp28bQKd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FSPjBSSU; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FSPjBSSU"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81345800791so3492277b3a.0
        for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 03:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768907469; x=1769512269; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmdP9sVSN2cHqDVsJHM+ds9zx07/+5KgfWHAIVzEViY=;
        b=FSPjBSSUIItX9Vjs2sqI9SfF4/65JmoChW9Edq8/yog5uuT/gsg2cnpvHoruVEZunZ
         qBNzqZTl4sPLJU7bvwg7WmfEe+so/Lt7E0M2r+4SRl5SdQAQvhadMwZc1wKoTwaq19Hu
         fQ20SOwCZ9MXWhdORSRUUqw1V8I5tjcPWJe/etecs2zruCcQtYRm/7MSzAZ8+thAo4cS
         TMYIeYB3db+MR8r7PL9HUsQInxcRiC7SZQRq4kPDBrsSWd7NrhltgwiY1abdzwa4n+iu
         OBn1IIoiEHd4WEu2Mi0nNNKLcqfs8zv1AV2+H2bXfjnODJ+CRDCu2byaySuKQXbIb57y
         LtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907469; x=1769512269;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmdP9sVSN2cHqDVsJHM+ds9zx07/+5KgfWHAIVzEViY=;
        b=lV1FKAffShjokBPtttCmwjwQ1qkY9BitbVN/1oOgn/tZAQX+jRFhoapF71nXwany9A
         YH24T5KJodFuI6lebdxdQd/CkvOGq+iQ75nDn1qDeGBmI9JKNVgJr1BLSvGndZ0VtjfP
         EMl23Zrbrvg+pknZ9Jxsn7kkY2YcSBGTAJBpX9uB4MLC7KQfPMUPUmWxoApfczGKXr3a
         U+cy/ff6puAjG8J6q3iQWI+UzehPk2fpnzJUFLio243hQCBS3HAKMpaCD5DNk+lfZ2rz
         2lA8XauN7YjxU4Cl6Sm6SoPRXqiULs2r+tkd5cyICHs0ACavYMp8KeT3zr6bURk2GJwF
         dhaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV15yLmTiBTDD1eITOMWIw3naLJSjI0LB9urY7dqv88zGtWYuS0xJuQH/oZlbnnb8ArAbsdlH7tgg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx40KFiSe1ZDU2L0GyZS/MD8KCLiSxFs5cIvMFjJaLbOmyvC33X
	oUUCKZbrv+HSR09w0K0NjeEG3/Ks1wyVzUfZknYlPJcPfZcWddJUrIWquRq2TNPPDSM=
X-Gm-Gg: AZuq6aLNYJCHoyGxUTp6IiHWI6ZvYH58J+SSbtGiGsNXs/UVj9UKD5fl+kDV2G/C875
	bOpHj50iioUusnOsIeomYFM3utHd4dEclo6qiWr7E4mboULKblPJj7E86SG+XfYnMXbgTl2QcDc
	ljoHu30E6w63meBxDzoOuOMGp3dyU2dWb/4JPMIq5RgFbJaWLnnnhydluOXOtayyBAHnxJTEWFg
	UgOzLKJCE2qZDsRLXIr+Bd6VV6minE1uLZYPvPZhTPU1DRCCLq9WQjEs5Hb0qs9i0QVKnFMKtSp
	j2YSRJkuSJaVBEjUadYTsjZ+EfwnCRnH0V6vV5QU5HTOAqdWD+3+hJ2NRt0fxN4GEjbtsaK3wyv
	3Srsv0+OAj8dqMhUUv6PNxrM9xjWrrXms5VCT3JwrGSQbVLOQvHASZ/xRvkYpqRhEVsHKhNChrO
	dYHY5PMdD4K9ELRzryyrzuCrhHJoX/dBw=
X-Received: by 2002:a05:6a00:1797:b0:81f:9b0a:812a with SMTP id d2e1a72fcca58-81fa1780e68mr11976552b3a.14.1768907468605;
        Tue, 20 Jan 2026 03:11:08 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4015])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10efc6bsm11398349b3a.29.2026.01.20.03.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:11:08 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v3 0/4] reset: spacemit: Add support for SpacemiT K3 SoC
Date: Tue, 20 Jan 2026 19:10:48 +0800
Message-Id: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALhib2kC/2WOSw7CIBBAr9KwFsOn2NKV9zAuaBksMW0VkNQ0v
 btIY2J0+Sbz3syCPDgLHjXFghxE6+00JuC7AnW9Gi+ArU6MGGGCMibxlWMHHgKutWwrQcFwSVF
 avzkwds6p03ljB/dHKoZtiFrlAXfTMNjQFCPMAafqgVAq0VvorQ+Te+ZXIs3G/9VIMcGgFanKq
 tWg+dFZ3/mg3D6Vcyeyj5vapP5yWXJLUWnDuAAD8sdd1/UFdJX0pBABAAA=
X-Change-ID: 20251229-k3-reset-8d9b751ef391
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

This series adds support for the reset controller found on the SpacemiT
K3 SoC.

The clock driver changes, which defined new auxiliary device name
patterns for reset on K1 and K3, have been applied to the clock tree.
To facilitate merging, Yixun Lan has created an immutable tag
(spacemit-clkrst-v6.20-3) within his pull request to the clock
subsystem [1]. Hence, the dependencies mentioned in v2 have now
been deblocked, making the reset driver ready to be applied, if it
gets approval from review.

In this version (v3), the entire series has been rebased and tested
on top of the linux-next tag: next-20260119.

General informaiton about the series:

The K3 reset controller shares the same architecture as the K1. To
facilitate support for both and future SoCs, the existing K1 reset
driver is refactored with the following changes:

1. The existing K1 driver is moved to a dedicated 'drivers/reset/spacemit/'
   directory.
2. Common reset operations are extracted into reset-spacemit-common.{c,h}

The K3 driver is implemented using this common infrastructure.

Link: https://lore.kernel.org/linux-clk/20260114060410.3340540-1-yixun.lan@gmail.com/ [1]

Changes in v3:
 - Updated dependency status and base information.
 - Patch 1:
     Add Acked-by from Krzysztof and Alex.
 - Patch 2:
     Removed trailing blank line from Makefile.
 - Patch 1/2/3/4:
     Add Acked-by / Reviewed-by from Alex Elder.

- Link to v2: https://lore.kernel.org/r/20260108-k3-reset-v2-0-457df235efe9@riscstar.com

Changes in v2:
 - Patch 1:
     Update the commit message to explain the why.
     Update the spacemit,k1-syscon.yaml to point to k3 reset IDs
     header file.
 - Patch 3:
     Use dev->driver->owner for the reset controller owner instead of
     THIS_MODULE to fix the module reference counting issue pointed out
     by Krzysztof Kozlowski.
 - Patch 3 and 4:
     Update the K1_AUX_DEV_ID and K3_AUX_DEV_ID macros to a simpler but direct
     form, one benefit is to improve the code readability. More discussion
     can be found in Link [4].
Link to v1: https://lore.kernel.org/r/20251229-k3-reset-v1-0-eda0747bded3@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (4):
      dt-bindings: soc: spacemit: Add K3 reset support and IDs
      reset: Create subdirectory for SpacemiT drivers
      reset: spacemit: Extract common K1 reset code
      reset: spacemit: Add SpacemiT K3 reset driver

 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   8 +-
 drivers/reset/Kconfig                              |  12 +-
 drivers/reset/Makefile                             |   2 +-
 drivers/reset/spacemit/Kconfig                     |  36 ++++
 drivers/reset/spacemit/Makefile                    |   5 +
 drivers/reset/spacemit/reset-spacemit-common.c     |  77 +++++++
 drivers/reset/spacemit/reset-spacemit-common.h     |  42 ++++
 .../reset-spacemit-k1.c}                           | 107 +---------
 drivers/reset/spacemit/reset-spacemit-k3.c         | 233 +++++++++++++++++++++
 include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++++++++++
 10 files changed, 583 insertions(+), 110 deletions(-)
---
base-commit: 6ada99659c6d6a0cde83e6c0f4ed0ef0ba1867e1
change-id: 20251229-k3-reset-8d9b751ef391

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

