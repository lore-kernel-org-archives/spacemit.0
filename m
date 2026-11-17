Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919164;
	b=uKPkNB4XMpKA8aPYDmdr9QHQkGuwT56mdqx3L03kmsVBpVMvvXTnytwvm2M3koNXO6hk
	 SROGQ4QiBdcp4g/egMMyRFyk9+/bTFSd2nfYz/GhHGdJq8jxbLO79p3rQQx3g7/4YU7rj
	 xTPj4JBip1oXbzruFSQjwW2bxj1YZ9smBg7JkV5wFBNYr8ue8ooVqYI8jiAbiqUITTg9Y
	 rGSl7q6g3qHAafhgfWON92VhuwEytMgilVkGsQD2oCusSg9k+ZP09Q2/FHXHR8CWLVBoD
	 WbisMyStrEWpqVwvC0qLvbwtXw5l3NzMD8gUDDxxK7cjWy/Fv26eETFV07B9TzQVkcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919164;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=WyrNoNNu/NB86HpPrgRxwPVRhvTuGwuFy/4c8+oY+lk=;
	b=EXmkld22k9viviSZGFXaPYPL24IBRJGQG2bx1tJkL/kSZlMMz772JowWzGKbgF56K/it
	 kNFgjlUNVT7MsQ/m9BeGoVHCGTi+NAz7s/lino72cCBxNQNXK0csB3k5QIZMtNfcIPVGo
	 ttkNBRk8t1cPC8aHxSnVxD7YCXLF3u2VNdqM9u9E1++jOPQ8PFBhmZVgzEA0B/U0GRzp1
	 uGOuKB1kAtMGKOxfcbY6+DzjNmJmDuJdWG2lmwG63fzxLB+tUO9aPn/tyjLSof+0I06Hz
	 vS2z6IWBUP+2UZH+qY0bKpeegaE3x01LoUFlml9/XjymxoIxWLBWLaMD29wNLsUQB/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WTjj4JUl;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09E5606A32C
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 12:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A09E5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WTjj4JUl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919139;
	bh=WyrNoNNu/NB86HpPrgRxwPVRhvTuGwuFy/4c8+oY+lk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=WTjj4JUlGsyYAkgMhQHzo5eKzYXzlMDEF+tTE+GlM1a69cOp1QBUhRV+HCCdMUdg2
	 ZpiwSbcWqaAWFFj0+UAchs9zVOpZpmIGP4PZaDMLnBYJdzdoM3TEGFbvhlfoFQ9+8M
	 TyA3SDv8aLPEIWE3Gs/5Oi9ISgQSBlzEUej47cz8=
X-QQ-mid: zesmtpsz6t1794919133t2371a5ea
X-QQ-Originating-IP: 6ydtl4G31wbLa9v/Bzv5QTDg8QDH0bcupB+OgsrMpM8=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:38:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7029049940140104590
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:43 +0800
Subject: [PATCH v5 1/9] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-1-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=1574;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=vJgNan3VXHrPIUL1xi2lNNcRCVH0/pu/PtlpRHIGzOA=;
 b=TKYkmXsQGomavDrUhG7EYK8cKbVQ9OZVj+07fN9tkJ3MNab0ch0gRCxyPH/e83ABECXAhvWzs
 JB2NnN5VornD4C8pphTwkA/Rv+Ro/+nNuRJ9HztVrPYKuwhyLMA6w0d
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MKP3LwvGEIjIy0pNxPZZGHYSqGTfoHcyg09LKEj1X+f57wtDNlyzM1Wk
	sUa9xK3R2leZo9jkSOrVS3UJNca/mbigl4EZOqfsMgKwBGqgV8B5PDAh9VFV2GRhV3XDSJI
	iovB4iYRWIvrfYzmTKULXn5joGQZG8Ee2DVGRyEuCdCojdb+UT5PtK+QWbONmTbe6zHai+P
	6BTDYu71LdXgkU31tUa5Iw4+sHfl+yRHNuo7F+bthE6Bw+CXZnTJC0z+O56ChvYTLzt3lga
	Ark+stGkxWaHIHBDecgOnoyz/pMK24RiXpctYOQcpLG7AVSffjjLs5jKHHziVE3VKWFnVbF
	Z3MNYWSt4enRCDNWedelmm4egKwBY0KIHeA6sW05PpBWEOy2eESgGmz98fqHGgBxnoMp+G7
	M7WCJc6Lq4rzchYgkWrMe9ri2Iv6M0wunwraWIcFPqSqz1sdhrCyg/9uyPi+lZCxAZmOVCX
	X9eu35rtqP58TB3VnGP/0fKI7s35NIkuzzyILQkPs1s7g0uNajWyS7rh7Wk5AwTYVAa1Qno
	TSYrn34R9n67XO/35Q+94tHtj/c15qHf8WgXNZtuthNtbJDb89n3whAcImBKFCOxoZuQ2+9
	eduVJdDBYAP0LQevfGUFClGPlrISOdzym8Jd6CuueFxJxEKrZ8IS5EGH3yIVcTihT2OBEU6
	99VlJy0JAVQhD33KP2tt/adIdqiGQY8z2+rxOhQlyAKsiiW1U12Y0z1w0C6h5Crvw5Ic36p
	dz2Jo+9IKIyu6UQT6+peirRNfei66qOr3dplx7lwe8K8zxjzOG1S3s8AWiCmToB2SjdTqHT
	o0Gcorx6eMvYDs2i4QwPSgXcp25LZrmOhTAPsXcP2ZrK4LCnP0iQ6LcRPaMEpVDlu0oKOF2
	aqA77Aq3e4GCnctgMwKkJ4S6eVRUFmMia0UBSzc8cjpRnQPjJiEUSV94cMRJOvlTRvmdMpr
	DmTFgYWFAjprmYEE2dmq2wj4q7ZQk9oki4EIN4lyGJJYAnQ19dtZCdXHLqhg4lA0UzaNVZE
	YxT49L/hOZUijCeZYONAYfTAmKXQGrDOylGxDZOOtTo9QGGPEmfSXyigOV+k3P1A90A0yuG
	UghCvNsjl2HgP5tgZtmQRZxbw8l44p2tbQmz9iX2p80qxJa6kDaVuwILM2BrBnbhWweTM6P
	oh4ye9iUWOXgkhE=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
has no internal OTG registers, this requires flags which disable
related features set in platform data. Add a compatible string to match
the platform data.

Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
work, add constraints for it.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d4..5c2b7eb1a6ff 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -25,6 +25,7 @@ properties:
           - nvidia,tegra124-udc
           - nxp,s32g2-usb
           - qcom,ci-hdrc
+          - spacemit,k1-usb2
       - items:
           - enum:
               - nvidia,tegra114-ehci
@@ -113,6 +114,20 @@ allOf:
           maxItems: 2
         clock-names:
           maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-usb2
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        resets:
+          minItems: 1
+      required:
+        - clocks
+        - resets
 
 unevaluatedProperties: false
 

-- 
2.34.1

