Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA025D53B
	for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 01:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426788; cv=none; b=Jm7T/wvgCBXr3S4rQvW1R11MTxSjjuX5FMRQomB5h9o6vJM7iqu0Ywx2uBtL4KsSMw2NwI2SCSpj8s7hkp9yDoefdQlTqNMD7TEf7wasRabI2aRDU+K0V/RTlLmiraBYBFej81hY9ZXU38t5yT/KiI0svUIODlTki+wTGpOnyvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426788; c=relaxed/simple;
	bh=PyG99/8R0TpsWO1jWHnifATKcOhOPS8LywBZeCYZFZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p9WqH4nJW9tiQNg9Sq6C4vaVufx6pYRoGIk6DGOzzedQOfCyjidIf0CfNlgjQ/G2HsPRHkLgSDEBH08n57jQ3HrrASY22r4ISgr2ezXCf4FkUsYDhKe/4mk7QJDLeZ3ChYw+SONNH+DdeDF4zGoA4zJWhGkVGTPsysceCDiT3JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=JNMcrLj9; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="JNMcrLj9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426759;
	bh=wUXoDWfKSMmaRMhMXzMvroZGWtAYAAcr+bc0qP0VGz8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=JNMcrLj9w0X+h79JtqCxyAl7se6EjSuxeYu/iFxErHjhO3RYFXyk/yI5+i/d45xjk
	 WAVUyRnpSRcnLBNsZociW9Zj9Uc0o3VCY3UsHmFIQdXsya5Nw1sTnJpzZoyvT3htyv
	 L0JWCzP3HV3o/7DbR73oURJS7NntdzFQ6e/YQjWw=
X-QQ-mid: esmtpgz16t1777426751taed3181a
X-QQ-Originating-IP: vI4sGNfIgv1/h6mK+YQd1WJmQOsZPj6r30Cg1uCqF3A=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:39:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11863181746122903502
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:49 +0800
Subject: [PATCH 4/7] ASoC: dt-bindings: add SpacemiT K3 SoC compatible
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-k3-i2s-v1-4-2fe99db11ecb@linux.spacemit.com>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=2426;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=PyG99/8R0TpsWO1jWHnifATKcOhOPS8LywBZeCYZFZY=;
 b=XPnYB5sjZ9lutwmRgfjnz0oFWS9Zl6AxEVe+jvTb9maBaSi+h5G1J+ifvsEpt1vdxM4vWqIly
 r4iSsTIbzNCAFX10bIHT7pe+HZc1V1QBdd7FpLdew8mK2kPqfcC5oxk
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MPoQK8KTupOnYkgjQupuMK6nkUZUsCjJhw3hcxuL+Zh2RPDFOXi8iT3v
	QpVpTKQkdSj8HiSwe7jQJr2hS2TV6ADY8GgU3iiiIXK2o13GEbzRO/aehXO/hwaPZG5gu/d
	oV9Jlu8q9use9RvIXVsH0vZodt34Xms2DWGr0ofb+4BaqGH91taclaKqNk5dWBsuX+O2haM
	vzOhqZf4G3rb3gTrxbtC5Bu++pBuw/zio01HrIHI37b6uG2QahF4auEpPnK8It2acIzMzqm
	gmC3fiP6tZPEnwnGIs5jmThO9SutOkkTIzik0bBrbFr/NhAv87OVscvkb8gBXz0EJfOZEB9
	BwKNn4YEY8qOU0yxc40oerigTWkARzRVVya2i4vHzomouZvo2TZEaMXKyJd7gplKvF2kUiR
	ZE9YEixSyfqWfirDQ1BGUtc0c+HQSdPbXQo9hkdokb+6LyuuAMKi2C3Cii0aslzd2XdOBWm
	KfEL5gnhQ+17CNoQCEhts0lzyMsmSQMbqmepFEYq4Qez66p+BJO2ymABtdwTKFkyk0V2B0Z
	FV0HgjdmgScIRcVFFxH4uBhMrBKFbxjYoay+pLgLtC1q/UXe2caXggHI46PKE/re+D2Xv+W
	HW5JAY794rz5Pz9A4otzb9ugO4ogHbn8ssYK2gM/22HsNH7Bs0feLye9cKFRESUK7DS7kSP
	Zb+VD1cxaP5TUBxD2ozWWqhIFfmOz2H/8r6rCraHwx+CFZtunFvlCOdHP3mQgtsMLvhba9U
	fjdNfXW660lnTNkYE7zE/sCdvxuX3TKjb6KXA4TOnmUH7M6ZxlM0EVWv9UDngNEKk1sdzvL
	XnGCHyvCGPp90ekxfyQDJVrGUG25Fi/FhwfKvpeUqbFk4T3/HmRRoP9z8ZZWbt1OImxNWMe
	cwp5GeX7F7rA4GxPw4ujJj9DlVq+0y2HlMkwPugiIJfELxHLBs0cl/+i3MSywoURJqP6ENv
	asg8PU5bALyffBOD1m8HUlLq105km4EacNTntot4sye26hcZxx/wGb1JW2VBRbXVsGGtclv
	Z95TlfD2jbABeg3qTKf5IgiYphmqj75xP2lyJmxiC9o4/XkSWWT4hC4cyD9tPx7DzASlm5k
	5KFNq3hU/t491zjLzAoMhIbA5zH0V1y6Y7KGwJk5BTIS01yaWd+xjc3626roLEc7X+FvGU9
	7tqsQw8l1FumGdpX/NKQT8CxaidzOjzqTLMx
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Add the spacemit,k3-i2s compatible string for the K3 SoC I2S
controller. The K3 I2S IP is the same as K1 but requires additional
clocks: sysclk_div, common_sysclk, and common_bclk. These common
clocks are shared across multiple I2S controllers on K3.

Also add the spacemit,fixed-sample-rate property which constrains
the sample rate when multiple I2S controllers share a common bclk.

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

