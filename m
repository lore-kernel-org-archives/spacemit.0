Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077CE342C8B
	for <spacemit@lists.linux.dev>; Mon,  1 Jun 2026 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320955; cv=none; b=IqqcYc2LVXMNPPspSQEKMFmMLSrfZMKuqHgV0SdJctHHYibswSbisH9JPe68CiMECMQBNrEdEKjD8u+ddKJO+hTD0+HOtpeVQDos9lzdjL/rb5melg7FCyFZ8M5xlBOv6dplmD2WYyT5rP3vrekDUOEsFBfZD/jYV+k0fuHvIPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320955; c=relaxed/simple;
	bh=U81JaS+uVsOCq5xH8KHw7CF8Re1+ZOxCZXh7B8IuBNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Afq6RzAbEVfn5YI+TXdZF8yMWsycqZ1olNa6yM4kBUkZzqpRTw7RL4POIb7WLo6fXIHZ8m3RhEgdWtULLI6uDTSIVlOGpHgK6ccSgWZu8w1gMjxwx6F6jJzzF1zYSLoZnOF7rSM+lOqNALxUIY7bjCLCttrJy2VRLo7ztBl2E4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baHGMTqs; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baHGMTqs"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c3184c71so9678015ad.1
        for <spacemit@lists.linux.dev>; Mon, 01 Jun 2026 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780320953; x=1780925753; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IbcsOvpeEjozPZH+4z97yjnc522GeGwDhfuuOcja+k0=;
        b=baHGMTqsyq7IjUXvjE4mZRT/WPsy/6JVQQWIyaruI+MZtOCK/CiiU+YpHNsnbzFJ/X
         isxRMzNago8YjJkzlv7MoY7iN1Zv+TuxR/geOgjc/0O3/1uefOhiKIQw20NzdUPA3xdu
         msmDxjb6xw2HAv5lmbqZ3jmnxBKbxyvBhS4qek5BhWrxx16qFriiBbxU373KxG5QIN1c
         LWBQktjcTysrLK85SU4j76Ylo6oqoNhpxSJMuttct5LX11eINBezD4H/BYmnXmQBmX1Q
         0YFku3dJVyfire1onehUSERl+3XrRhV5ZJOJLyPaDayKBnjJWodeQNayXIh8bhplNfGB
         oveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320953; x=1780925753;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbcsOvpeEjozPZH+4z97yjnc522GeGwDhfuuOcja+k0=;
        b=CHHxsR5rH13sx4WJc3PstYzUobk5X9P/A5Hbi0jTmRjo1FMbICfSO063gy586L7mMk
         HD9IayERXLSrDsPNeSz7rC5C3ZuOenEKZkkjhZOqgCh0038ul2LgqGp4DwM0831AIBD/
         EDOcIOyF38VZkG4wT/NF4bi7R2bgrhkcU3Y1gzjFVlCHghtvbu0DM5EHvVpyYZIwAN2g
         oGZt+ls16y8prd55fJnngYhDZvmPu6ec25NNNuM1jM2fIf5lgWqCDkfQhQK7PN8SRnBE
         xm6zC3wEx5vlDuDg+dHn1hjFiHMoW0MUUeqOGSE867qR/0nWnsiAyZ2tMMhpyQa5JvHT
         9OEw==
X-Forwarded-Encrypted: i=1; AFNElJ+SiIkOe3E31U/5JbRH7JPPRvF3xrrVs4kKGYPiSxWzFpsZui0H8jIFygWnCb/40X74Ks+0NKZDxw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw91gZyr86ecVc+kBMamSdiHg2gTpL4y2jWTFdqkFhDPxRJn3JD
	R6+Hx2xW9GIPdSSCktTQ2AE72sKyxP5x8t4nIM3CvCgbYxiGqxOa0xrJpD5ZMRxPJ6A=
X-Gm-Gg: Acq92OGqPejmupo8kL/KNTDu3D1i00Jz0nXMtwVCu/27OXL6IeaeSBrPKKr7L+kIQTS
	Uh2oQQC7oNHbLoWnx/IzaQPZR2DWnCH+V3YCjJtCGNike2HSH+ThZeWJlsLelDCi1Es/iz50X1P
	X5Z26YiJP6emuD8eZlzAxX7gm49O0bw92rQxSnNBC9p56+agvP/VotJJWmtwTfjswnAm6Zu2RcO
	q/6NBfntpo1Ya9UkAxCeSGmaVbhKAB2LBmnOQFE0og2wRYZrHiQtQGvDDeL9ZJgtXdjsqwF/d48
	X6n4lqTcS3Pv8lPPsx4RRdJ7yoSa+DfKJATZrfbxl0irMKs6gapca4SmONxEKs63XGAwv5U3t6R
	QhGnY2PI9t/WhR5y8nhFxW6U/lRgqUcpZp3Rf3bj0qFCPPqBp+ypB6sRaR9QgQ18eXdu1d625HI
	I8Ae+1YTWklg==
X-Received: by 2002:a17:903:244e:b0:2c0:d097:51ba with SMTP id d9443c01a7336-2c0d0975470mr58699645ad.26.1780320953126;
        Mon, 01 Jun 2026 06:35:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm143136885ad.41.2026.06.01.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:35:52 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Mon, 01 Jun 2026 21:35:06 -0400
Subject: [PATCH] MAINTAINERS: add entry for SpacemiT reset controller
 driver
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-b4-spacemit-reset-maintainers-v1-1-1ab3014e9a35@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEkzHmoC/yXMQQrCMBBG4auUWTuQlKYYryIukvRXR2gsmShC6
 d2NdfEW3+atpCgCpVO3UsFbVJ65wR46SveQb2CZmqk3/WhGYzkOrEtImKVygaLyHCTXForyEF3
 w1nnvjo7aYym4ymf/ny9/6ys+kOpvStv2BbDluqCBAAAA
X-Change-ID: 20260601-b4-spacemit-reset-maintainers-4b5a91599585
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>, 
 Alex Elder <elder@riscstar.com>, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=U81JaS+uVsOCq5xH8KHw7CF8Re1+ZOxCZXh7B8IuBNE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiw543Cn5BU3Fq/3y9acfvJ192yRmf3GW2/tSJ72OW1Fz
 ITTgfKrO0pZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAihxYy/C8LDnoeba06o9/Z
 oPDTZB25Fx8us7wqecOn0vRuyyw7n1aGf+p5F5NKPRlOGMhrS3Ra3NO/v6Lg8Xff2LmOy9IDVov
 P4QYA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

The SpacemiT reset controller driver under drivers/reset/spacemit/
(common code plus the K1 and K3 SoC instances) and its reset-ID header
have no dedicated MAINTAINERS entry; today they fall only under the
broad drivers/reset/ entry of the reset subsystem and the N:/K:
catch-all of the RISC-V SpacemiT SoC umbrella.

Add a dedicated entry and list myself as maintainer. I introduced the
drivers/reset/spacemit/ subdirectory, moved and refactored the existing
K1 reset support (originally written by Alex Elder) into it, and wrote
the K3 reset driver. The series that created this directory and these
files is archived at [1].

[1] https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
I contributed this driver as Guodong Xu <guodong@riscstar.com>;
docular.xu@gmail.com is my current address. A matching .mailmap update
has been submitted at
https://lore.kernel.org/all/20260601-b4-mailmap-guodong-xu-v1-1-ee9eff1e57ba@gmail.com/
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ec290e38b44a..c9d87244c1715 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25119,6 +25119,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 F:	drivers/i2c/busses/i2c-k1.c
 
+SPACEMIT RESET CONTROLLER DRIVER
+M:	Guodong Xu <docular.xu@gmail.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	drivers/reset/spacemit/
+F:	include/dt-bindings/reset/spacemit,k3-resets.h
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260601-b4-spacemit-reset-maintainers-4b5a91599585

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>

