Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86080194A65
	for <spacemit@lists.linux.dev>; Tue, 28 Jan 2025 04:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738038204; cv=none; b=d+DqAqLZzIrk0fbD37OztMRQEd573KQ8YBAl/jOcCrKsButKH8MWSWoLUc1mb6IyU7LjfLiO1ZwoS+eW9KM8vKdBltTkwirisB4s5cI/iHT1t7TsoedGJnXV09bj7x2OhSDAhRBfmcO2xn2wiZPRRFyYE/GoFjCJvgKfaXuHleQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738038204; c=relaxed/simple;
	bh=p6KU/SgyEOlkeT46rnX6gRJRS45BoDhxbwx01TtZJDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mhrgyzYcZ+4CrSb3HCojFPwkhaoRPxqW4Xu3dOrHKQPr/6GXYp+gjNTVHExhsEFhg7ILlq8IeT+dDBewor80Cy9uSBMY61DM5jTSpmdVDCEdRmhszgOKOVDKBqSolhYkzVQDwHl3BuEPcQOQqiy/3VuKn/XViXfmnAnfldrlABs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.60.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E345D343581;
	Tue, 28 Jan 2025 04:23:16 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 28 Jan 2025 12:22:52 +0800
Subject: [PATCH] MAINTAINERS: spacemit: update various info
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAJtbmGcC/x2MMQqAMAwAvyKZDTTRgvoVcSg2ahCrtCKC+HeLw
 w033D2QJKok6IoHolyadA9ZqCxgXFyYBdVnBzZsDXGDK+HmNJwZiUhopbZkWs+OK8jVEWXS+z/
 2w/t+E4yIEWEAAAA=
X-Change-ID: 20250128-k1-maintainer-1-5e45109d2a23
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
 Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Alex Elder <elder@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=p6KU/SgyEOlkeT46rnX6gRJRS45BoDhxbwx01TtZJDQ=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnmFuxRUZZwhzGuJ/gHNR4f948psYZrAXIDBEon
 dmv6/Bvs7uJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ5hbsV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UASD/0b4GlbXp5c8ZX1Ba
 3j8FSvY2Me2hcGBbdlGKiLnFjk8qqGtZ76qxclx7z7oaCY4Rtagi6Z/WWznZo4lg2sJWGkdn5K8
 OcLfoWS2WbYy6ALD0k2lUtCtybM01Laq3srQxljpZV1IXDJ5d8YwKe+EacS/lLiGXt46fwPiunx
 6Yd5p0WkQmt05G11Lz3Ytkpxs71eiUfRrct3M/+jvmhUtwjGtcYlRLWDH5IzqQrhDWwtoCpbBH0
 FW5X13JiBU/rzIXcYvQSTkl0jXPHpEtKtzmz47lOGsi+EF1uNw7tqQ5KmdZAc8+OWE7uYjXEAlE
 A+zR7ClwBc53+i78WoFjKbB/lkJixhcIVjVhuMbD/69jdJhmJcmhCFs9KKSt6MSOSqvgdBc8Fcp
 PuVS1GSv78LVg+B6m9lmKA243D4erh902v46Cso4JtMZ23GKbWFCLcrcoP+aGNvb6di8U32a/20
 PtbhJa321YPSWEceHfdk4LVAFsPRGmsXPsRIj/6opF0E8YBzkEv28Y4Ke3N/p+NOeiUV2X1ME5j
 wCqdrLirx7HRkCdoBiCn6FcKppi6b/UxDeyQoqoAyGtzQLesmEnD6k4E9fcq6HzWmw1/dhd1x/M
 M2ZUTC/25wRsLbBfepWhK0LSYvHRiWaTncHYUDrRBrTWos6Twy/cdn+aDKM1WpvzembA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add a wiki page to track status of mainline effort, add a dedicated
mailing list which can reduce the email's CC list a bit, the irc
channel should be useful for people to communicate.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Add additional wiki, mailing list, irc information
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d49306cc17e3403dbc06e2c7927d6cfce514481b..bf30f31e412fb50af8c0aa49fd25483ef229d37c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20326,7 +20326,10 @@ F:	drivers/perf/riscv_pmu_sbi.c
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@gentoo.org>
 L:	linux-riscv@lists.infradead.org
+L:	spacemit@lists.linux.dev
 S:	Maintained
+W:	https://github.com/spacemit-com/linux/wiki
+C:	irc://irc.libera.chat/spacemit
 T:	git https://github.com/spacemit-com/linux
 F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit

---
base-commit: f34b580514c9816a317764e6b138ec66a4adab25
change-id: 20250128-k1-maintainer-1-5e45109d2a23

Best regards,
-- 
Yixun Lan

