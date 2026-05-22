Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BD83A05F2
	for <spacemit@lists.linux.dev>; Fri, 22 May 2026 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455602; cv=none; b=OY5EZub3m2Gge4HBExvWWwLEC4hnSBZ0MdMiol77EzVUhIjOHjtwCG9DKzKSRSsQlNUS3Cq8tgIgo6fO8zbhCmX2qzgKZkiN7vcAYaWOvn4TidnIg14/4pjgR/aihffbrgYDj59N+a1SzOCHqKmioyAquGbp5aUUR9GDou+pq5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455602; c=relaxed/simple;
	bh=WCbZ8iopcLSLXkEHIgHHSSkd2u1qQfx30P4JpAz6ZKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DuQZfW45W2LghLquusxXhOOunS7J2iSzZH+NJjsTkoylywJUCZqQrfwaBhgIW30Ni1IZaw1INlWDfHmJLdi+hgYEvghZq698c8Laz4yPcVXD+1LzNdDMopvYkFhFPQdXOWIHI7V4tAC1uMdZRTpWU6BbnhG6nIP1WJczsw940Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=pELcRAcS; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="pELcRAcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779455549;
	bh=TmI0UH8/e3iTldNLhwHi7B9I6Rl5C/JYONWEHU21eJ8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=pELcRAcSzwyEdNvDISAm9w+laWWWV4ARa4q9MCRKT51J/ooXGGrmhyebnEVqlY+Vv
	 H+NPT0gzuZIw61P4N5xISy7iR/PSyf4UjkBgBRF9tDGleHZrWPM0ztEhpQgdlZ/peM
	 RUw+kOsjua5C8Mg6mkgD8mXlif9+7qE6DgHnK5LE=
X-QQ-mid: esmtpgz11t1779455541te29f3b0a
X-QQ-Originating-IP: VzNX9YRWRqB5R6Dems1eB3rbkqjzRrFXa6EG+p46DKo=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 21:12:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14195901067407488268
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 22 May 2026 21:12:14 +0800
Subject: [PATCH v3 1/2] ASoC: dt-bindings: add SpacemiT K3 SoC compatible
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-k3-i2s-v3-1-08e3eb811d93@linux.spacemit.com>
References: <20260522-k3-i2s-v3-0-08e3eb811d93@linux.spacemit.com>
In-Reply-To: <20260522-k3-i2s-v3-0-08e3eb811d93@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779455534; l=2349;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=WCbZ8iopcLSLXkEHIgHHSSkd2u1qQfx30P4JpAz6ZKw=;
 b=QQGi/9za3k+THqNYX5wU0DsXs1+iVxXoREo75GjalvipjhfOm0a5i8lVp1Da/Yokt0E9yMW6J
 OEhPwxQkzo3BHTyDNudFOVH37fsHX9+5LkbI+1OfKW7Oinou3h/T7O2
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NGmIuw/XohCq2mSku+M4Aw1jKgCi381fcQlO75cMucl+aDv31Ngvtz52
	slxH6y6vhQn6h6rWid7886d77VJspRCH0z+Vys6FZu2rZXHDGVt3fwIYAJ0xz7uEH7GVzey
	Xs/loFFmy6U4MF6zRVZe5SPXJCw/SB73YXaTiyB6Gm/zGh9aAHgrZrSBu2r+sDmDhJrOo27
	sggqQE+Fadc+BbYYKM2vdkGNm6oF2JY8qmROgcodCulGiAlmhw9aqYUC7IbSd5JTAPj/PHJ
	W8zEWUbne0rkn5HfucjLoQx83/0oTyjRg42GWEzL8eYR/E0PQsIGwiQrWKe4IbawG9tR+oo
	qh6nzVx37WmeDplBpCeadQ/lQsJrvMM9cLu0PhcxBskMuspzkJSf3147w1atiGP+x8n0TQ+
	dy2YOGlm5YLlN0li6uMhePleGkqDblNjCbI6mveFXzUe5cJEu5Q141XLT8GzlJVhr3akkZC
	9JhfLXXA1zA1y/w3r9q3xBHtE9pv/l6KF0Leh93jx0BXZkQ/k/F/6MILaVF1GnRjwR6dy19
	Dx02sBA8J6sgvx15xYWx3VR/VWqKznERnAwhAjjmJ0Jiq2461JYa/KGgg+45RG5T42TSYhk
	+VHdF11hRZtUiPOkvYbmNKlnRDFxDhHBMHImUDHIWoVFXu3odkpyAfndaHD5+G/MOZYSQ2P
	uSLuICHceqi9sQht7U7o/sL5B4wMb/OcM8dvsT9UCDde6aEVpjW7KkBIR8rO8GIPEcH6d/K
	dAOkxOUh34zVlwu1aHQi/+1Sd9t1pWyZdgr9x9HgWQAqql06Fwgi5nb7nwmghOJO6VSqU/k
	Op6hK7xk0JHIqi/prq/XkoiAGAho32qpoN6uplD8I8P4RTkLd5zK1pfWrw/Kdh+gD1/Ea8+
	ar0hoXwqKkbNEvl8XV04L8PuRx+z+WF/nRSIcfEJk3fjniRwoe6Hg2jTtAzi21I4rG6BXdd
	JDCA9ja4w6CEdAPfWEbEaM50CAKiUd9ASSQk/gez6XM3x6cyKzt+YB6Og3WW6dMtoTdwtXh
	AsXbI7ElctepstYis3Ko5xxKRVLX0ceppUzvTyaMwQwnJHs/YxopMEnfoOH+GnEY5vB345c
	hU1lL4LMeuYpvqddQ+ZJ8IS7afaKIsQiRKYkRBXcFMt98IEv82dSTUhQDMXJxiL4E1OMgL5
	DjxMBk9R5zXFIinDD+eSX0vpRveI1PbsTelk8ck0pvMByK52AYsIOoJOxA==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Add the spacemit,k3-i2s compatible string for the K3 SoC I2S
controller. The K3 I2S IP is the same as K1 but requires additional
clocks: a dedicated sysclk_div clock, along with common_sysclk and
common_bclk which are shared across multiple I2S controllers on K3.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 31 ++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
index 55bd0b307d22..240d90402e4f 100644
--- a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/sound/spacemit,k1-i2s.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: K1 I2S controller
+title: SpacemiT K1/K3 I2S controller
 
 description:
   The I2S bus (Inter-IC sound bus) is a serial link for digital
@@ -15,27 +15,54 @@ maintainers:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k3-i2s
+    then:
+      properties:
+        clocks:
+          minItems: 7
+        clock-names:
+          minItems: 7
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
 
 properties:
   compatible:
-    const: spacemit,k1-i2s
+    enum:
+      - spacemit,k1-i2s
+      - spacemit,k3-i2s
 
   reg:
     maxItems: 1
 
   clocks:
+    minItems: 4
     items:
       - description: clock for I2S sysclk
       - description: clock for I2S bclk
       - description: clock for I2S bus
       - description: clock for I2S controller
+      - description: clock for I2S sysclk divider
+      - description: clock for I2S common sysclk
+      - description: clock for I2S common bclk
 
   clock-names:
+    minItems: 4
     items:
       - const: sysclk
       - const: bclk
       - const: bus
       - const: func
+      - const: sysclk_div
+      - const: c_sysclk
+      - const: c_bclk
 
   dmas:
     minItems: 1

-- 
2.54.0

