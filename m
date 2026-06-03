Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CA53C4552
	for <spacemit@lists.linux.dev>; Tue,  2 Jun 2026 22:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780439218; cv=none; b=FWCeIWTbMokV6o7BGzkv6ybCldQgJr/CrqpoiaGFFuoDmauVBxe7VkC5C+Ix8DE/QYWwngWggSajm60lheuQssSBl8Rf9K3gQLzJXiEXdgPljPjQjgUy6Czhc1GsvvrjgYkgq+nG5yaTVcR8g42cgBcXZ2p0YNRTAa+TxTaN8WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780439218; c=relaxed/simple;
	bh=r6qoe5HnCPTD19cVd5ECsifmTZ9MzU9r06AoxVG7f/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lWYTZ6rPBSRd0dH1C7H2OorerdYEpNujUcqvl907NVzLP2zQoNlpFmaMicF9KVvC6ML83QXoofy7oAYCQuy8wg0pzNG/DzWzhNJ1jRlrfyS5HpjLuQUvooQvx4ffQLb+e9oOrmGzGkHnvsCV5xH8KADpalVWCuOe8cFX1zPoMLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cq2Zc9YU; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cq2Zc9YU"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so2470684b3a.1
        for <spacemit@lists.linux.dev>; Tue, 02 Jun 2026 15:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780439216; x=1781044016; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OeVUpNSoatWZgvnpwiX5OT5mqrXXwumAUSFwCDIGdLo=;
        b=cq2Zc9YUEmVZxZ4iBUO+dVZwh86uM8DEuuLFgodD+X2jprD+cR7iOQMXxgiYmcfL+u
         TaDNbGI9srFQr55+r0pBT3/V5TtFpA1vJcDVVoHM9+dnjn1oDUebsx/pqgD2U1fptLGr
         3bWw1MZlM5Veuf2Uv7DUa7KqvMl8Tz7f0Ty8JUtbh431lLh/067pNQE/U7L9dhxYXnpH
         hXaeA9IW/PKaio6gZQvQTLH1QhBYLWPkAeCqRzCG99xWCIQRHBdsnE9lm6xx0sBnBii3
         CWxFzKQXmlvvsnh2xwx3nXunWBdTEHSIhNm1CO7jJjDlyXyWQUtQeHva3h6l6DaEXv5k
         O2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780439216; x=1781044016;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeVUpNSoatWZgvnpwiX5OT5mqrXXwumAUSFwCDIGdLo=;
        b=j+7Lher7uKJnDMONkSA4B60wVEobaB24zBngq9bNMXP6LWW+4dqI6gnEbbmCBJdOBt
         6tb6Dm3sTklzkcAa1tsYIjYABYNl4KzRLfTU3KzT4wLjnyInKcIwICK0PwUV2it0WyhM
         zWY076Vz6S1LUTLRhAgkS2rAK91qKxCaDtyAcTCqTbl2iLZ3VAxutSk+PI8X8Df9c8kC
         qZGSJSsmbGFYp9uvr9vqagjI9qBUnJse/6HwBifjENgToCh4pJm+jf2gUVpeTqTSI/Fp
         Hh8K9rAzA2JNhQvV8NTWrNFLeIrpyHqt17hxvJboM6QPc3auTPmAmd9vtjfTzjYt9GMM
         Z6ag==
X-Forwarded-Encrypted: i=1; AFNElJ8VGrFcbNnr9DVao32OHLLrE6z9NwDSB+48uE7WGIaxt4mcWJEtvoyul84kc0Rxx8/peUqDZgp2LA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzdPyBG8ctxKPoClwDxJu4Wm10IZ4CMnjLSavJ4CiHZUvjsuOn
	VtgNASRSd8L9IXxAVViTyk3hm2P/PM4gZhbLGO6Zjefo0DWxeF1oh41Y
X-Gm-Gg: Acq92OG15mYSlp6rXwmde0jEYpeXRUoa5bh/oatjAMPCNRtglJxC+HX7mHUXeyRADl8
	fY1qPP7ltKEv9WO1EB3zazWJR68xn5sJn3zQUbH51YkPyYnxgW4XqpbGz0/E7nc11iX8v4BdyqS
	f3hmTcZ1aj3iJrgJR0YEi4rqS8bXBqcQTsV7OJRRwAFvXwuxDzdVC63Hs5XSG5HbDmU5Tp3luLr
	x/E4SUI1emGH7KbX0QCkvXpJkkgftWrvC6/dkk51dYiV2gMaWpm3fHHuGWLlq+FsfZLSLbTi2Tc
	bs34gwN8TlWvQl0Elfdqnm/2ndHWdZ/4hQpML2coVYXDOvRtjsQW107PxQWXOKne/A06o9FwuzA
	jlb9rBv5ctA+uCFB0FIiBoHUK2oeFlvkcwRzxqZEGp4Oi9cBhSdyYr1sPwkerN+qxh3pTe0l49d
	Fvmqo9npH0Jw==
X-Received: by 2002:a05:6a00:994:b0:82f:623f:e5b3 with SMTP id d2e1a72fcca58-84284ec082cmr697402b3a.34.1780439216068;
        Tue, 02 Jun 2026 15:26:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428291ed20sm1009556b3a.61.2026.06.02.15.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:26:55 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 06:26:11 -0400
Subject: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller
 driver
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEIBIGoC/42OSw7CMAwFr1J5TVDSNhVhxT1QF0kwrRH9KA4Vq
 MrdScsFkOXF6D2NvQJjIGQ4FysEXIhpGjOUhwJ8b8cOBd0yQynLRjZSCVcLnq3HgaIIyBjFYGm
 MeTGwqJ22Rmlj9ElDdswB7/Te/df2x/xyD/Rxk26NnjhO4bM/sKit9++tRYk81lVS1WhspS9dj
 p9HPw3QppS+E2+mk9wAAAA=
X-Change-ID: 20260601-b4-spacemit-reset-maintainers-4b5a91599585
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>, 
 Alex Elder <elder@riscstar.com>, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1925; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=r6qoe5HnCPTD19cVd5ECsifmTZ9MzU9r06AoxVG7f/U=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFRr9Jp11YX2pOOvB0ofZVq+/ya80/G6++ZPCv8tAul
 5ULNPgdOkpZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAimokM/7N6NrPN+Mm0bFvO
 x9a1SSrueiyil3/VqattEQ63Pld6fS/D/8gu+aT6vAcc2s2t+4/pHbcp8ZwcMrfFUFWvVTVx3vN
 tjAA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Add a MAINTAINERS entry for the SpacemiT reset controller driver
(drivers/reset/spacemit/) and its reset-ID header. I intend to
maintain it: the K1 and K3 instances now, and future SpacemiT SoCs
that reuse the common code.

Link: https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/
Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
I introduced the drivers/reset/spacemit/ subdirectory, moved and
refactored the existing K1 reset support (originally written by
Alex Elder) into it, and wrote the K3 reset driver.
  
I contributed it as Guodong Xu <guodong@riscstar.com>;
docular.xu@gmail.com is my current address. A matching .mailmap update
is summited at
https://lore.kernel.org/all/20260601-b4-mailmap-guodong-xu-v1-1-ee9eff1e57ba@gmail.com/

Changes in v2:
- Reword the commit message
- Add L: spacemit@lists.linux.dev
- Collect Alex Elder's Acked-by
- Link to v1: https://patch.msgid.link/20260601-b4-spacemit-reset-maintainers-v1-1-1ab3014e9a35@gmail.com
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ec290e38b44a..b7ef4ff2a2054 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25119,6 +25119,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 F:	drivers/i2c/busses/i2c-k1.c
 
+SPACEMIT RESET CONTROLLER DRIVER
+M:	Guodong Xu <docular.xu@gmail.com>
+L:	linux-riscv@lists.infradead.org
+L:	spacemit@lists.linux.dev
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

