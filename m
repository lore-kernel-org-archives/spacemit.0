Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F00535AC03
	for <spacemit@lists.linux.dev>; Thu,  7 May 2026 07:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139249; cv=none; b=gDn36nWVq3za7JBV7yxtja6MaHsSPPbir/k2dj7KrzZhWM75h1hXjkPoN+HS/jrNpB87wxxJh57A82D4UN4E84SZ9ZJvuDFDLn+RHmq9+5whDVT8oPP9V+ZVBkhzNz5M77GAztd/bXhCKaLJDutfz6E4gJ5Er8KnwduVDeCOtpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139249; c=relaxed/simple;
	bh=WCbZ8iopcLSLXkEHIgHHSSkd2u1qQfx30P4JpAz6ZKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dh+eRJ4Zs/3J5fJoT3dPKb1lG3ItIC1MOHRoON6/nD0DoIX9Ib39XrMUV0cXzrVMYfANLyukBPQoWOCN3MBxbzlmyGzmL+gzlBbVJz8P6rBzhEuQbTHiGHYaEdig+VEUuS4sYnmigdo/HKYbK2iTZc7t1BV+SdxfGCzOZG7XdTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Afip2/0V; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Afip2/0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778139207;
	bh=TmI0UH8/e3iTldNLhwHi7B9I6Rl5C/JYONWEHU21eJ8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Afip2/0Vus4jnDDFtw1teWR4AvENUWBUT4C4vKTn2n5lmKAWZmjVs2R7Jk8u9ZCQA
	 rg8iZhinxZlKPbagIBiyOjGWpC6YYsGSkCqoRbiErOMfTv7OIKfhqBtIWisa0L2yH0
	 d+OKcJPkxC8xz1j3DS2O/ItvkGYX7JkRNHunaNn8=
X-QQ-mid: esmtpsz10t1778139199t214e8fcb
X-QQ-Originating-IP: uRFn5Pt4sifnfhp5pLw+QVV3Q0soJuo0yK/D2S4v8Pg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 15:33:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2117957216347348895
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 07 May 2026 15:33:09 +0800
Subject: [PATCH v2 1/2] ASoC: dt-bindings: add SpacemiT K3 SoC compatible
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-k3-i2s-v2-1-9cdbf95b7533@linux.spacemit.com>
References: <20260507-k3-i2s-v2-0-9cdbf95b7533@linux.spacemit.com>
In-Reply-To: <20260507-k3-i2s-v2-0-9cdbf95b7533@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778139191; l=2349;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=WCbZ8iopcLSLXkEHIgHHSSkd2u1qQfx30P4JpAz6ZKw=;
 b=PHU5vuDOslLdTy4s2nXnGFwbJj3d2hTEOIUWwPjfywaGpkYeNcfRDPkElTDuR50U4TaqEXiEn
 Lb5w9D9jKw+DmrDfijJOyiuBYffqMlUaMQGZzuGyePdc2PPZB9BTG0a
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NucVjjAjfB4UtHNF1KuK+C3VfmEH0oRYR3a+yGS8q7/9wpQywHc8Acq0
	f+T4/O2VLEv/XfBSiJOpfNyX5a/pf7eBXlduQldp3BfF8f8Ey8kmir+Eq1OwhTToRvHY9iQ
	n7pPfnppaqJoPlC70AdgEnwS3LCjk0WFse5HzKWEFjp1a9nels1ZE0j+oXM8nas+eFE6QXs
	N8Z8NN8iYLkQRXw+OubH1x+T2wSoiduMGzXCKCPE1vimQUnsTej8jJYdXTjnXuF6qt4JCQ4
	yOThayyOZjnp14+GMUqfLp1536HMh7El3J1p+1yuwa874ai5EyMoLgMWxCHCY1X1tCvsP3c
	8ckF6lRVEqX9Wmo7rKunmjoAIK8N3O6fGX6S2TIiV54nCsEZnJwdzIM94PaTW68qNzeSyqB
	ND9WY9a3Mx+yNsgTSsPh/TJrEDRANwDyYaELrgnyMYPPSRX7tfwDk0mJc0pybdXT5qAzuYj
	h8pyq6kIBWX3tDaEITsukb5uRKMKpyEyYbjycLvY89eorUz91YO3zrj8hnbjlLrZ/BD+c/5
	xVvaLziCxHCR+uM4a+vPD9PsMzVjnJS48yJ969Ztf45jalPjluR0UVx+RxgPyysgjHRQpmP
	Ujcl9Ss0THIJ03OizEfI+VDlGlaqw4kwWgRvu7X38Zqi18n8hrG0jOpZT4zcQXdg+P7tBUv
	6kuqo7uoyOLb3nVJHJPsrYgjqf82gP5ms2sa4aBIFYtDJ/AErT0BrqobG7Hnzq8SaZPgSfY
	UXU56F3WYurcc6V/kC5fUO5WNMTR+KB/Bny5YC4VqWpVe1+MpzIZ1uKBnZAtw1WF7CmjlsP
	RR8LFRGdXv1OWtEpo/DffS0czgvZ+pZMSNNW5udFnl0TMoEergq8NAPy9nDUXGWWtIiRyws
	U2ETJXwk1HnOhMiuIcWKnzL+PgoWrGscFe0mChTb4hKTlF4iaDSRMKlg7LAjF6L/TdE+eeY
	6MH7gutmvk+coDgWzOAuEW0IvqEQSPhiEDoxHHTvwsi6eVjLuo+HVmEMr2V+8dfSisI1Suz
	yG6sOQFrwBUj01ilODpzPiMnEr6uEHRB6dXP6W71gicMaTIGmuK5FuYAysgTifzYw4fgYX5
	CUonTIhKLRb5ZHU9dI46g4o6bADwzVd9LTVYim1U4HrR90Q3BpN7Wcke9JCfdNX00M5Q8pE
	EorLFZIXg617Z8opEnCKo+CLs0jmx1QsbreZE+cUvg3HakY=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
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

