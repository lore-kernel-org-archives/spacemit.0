Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23038175A66
	for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 01:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426801; cv=none; b=aWfbkVhcm5Atgs1oNdqNf9ubFSmHhVmdvDqA/pxurawvzYasqDWDxsRcunk+8PfOfUOyIltjYL77U5a4pCCUDQIGY609a0lKH+PV5Auv/754NFysnBTKF5OowkvK93QCgRrkwnCJAIX3KJr6yjdnev6DGwIuGEqjE23WRL+sqis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426801; c=relaxed/simple;
	bh=NAgZL6RRaKXXih+6ACD5ImpEXa86qDP16TxAOhPDHIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nGegYpQ/Cj1BMJECUH8rswh4JD8TQlQrYazk86AXH+84kqHAkU4QWFLV/IG+AkFQkJ+LGT0+7WbD6t0QR1DRV+XLKeBYuCjGDY5aSki6oqi7oQLTxsLKEhTv/nC9t2XndzpwmhZb6/8uHBb/KVRdus9tY4AThkaKZHQ/XAXKMvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=PMHPxM+M; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="PMHPxM+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426763;
	bh=FI4ajARcW5357tLN5/I0ua9TZkOJrFRVAlMis1T0b2M=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=PMHPxM+MdkxK20cLK6+5IuWDfzxgxJhU41PDprcA4fTm+chog750zcf/8Eefx+qFB
	 pCJa97kuon4xuNQRj/e1oEPysjWDBGjgvcE8cTUlGEoVC/iVbT3GH7D8OT+FM2PdUk
	 9VdFbEGuyD6rla0pxAzxMlspcbcQh+Sxti9plwZc=
X-QQ-mid: esmtpgz12t1777426755t013c7bfe
X-QQ-Originating-IP: xdBdhRDl77xch4NsM0af+nFog4tII5MZi881pdQy8Kw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:39:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7627828452192065809
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:50 +0800
Subject: [PATCH 5/7] ASoC: dt-bindings: add fixed-sample-rate property for
 SpacemiT K1/K3
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-k3-i2s-v1-5-2fe99db11ecb@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=1270;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=NAgZL6RRaKXXih+6ACD5ImpEXa86qDP16TxAOhPDHIQ=;
 b=TusiHIciXUEkTyZdF0agxDOszJih+9MIoUSFVA68HIDOa8vi2cUesDBfQe6f4l4R+9H2D8znc
 iEXn6JQBHR1DS1pO8ZQIdzSeDXsQeMaCRPGheSGBpUYrD6BmdWQTB97
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NogX0aiuLvlKalpi8EyVVslWua28pTXEt3tRapUcSl/V6fbTvffaHvA2
	empsSU7BOUgDIuO8cb0H6yhhPN8fnEOvn4B1isdrEXRrWI+2sXR1vWIBIvda0JClsPIQRns
	FUxf9f2uWTcYKJXGsedPjkm8JiLJAY9WK0L+2n4oZ2uZAKjz4Ze+bmJZkTGvokqySTxobtu
	DiXoMSyKja+uO3apBo7fsdSytmoIg2U0BV4pwnqWeGxwz36umliFD7PM6tKtbXwR4sjYs4e
	0DMhT4G0//ZyGjjLstSH9KqTtv3ovfYs+Z+nvLRLOZlIsGXIEJ0eibwdGlUDvAwylY0PTGr
	Lhwx94tcJOFoCu90QEs9PCTJ9TQyrOwn4Q3SwetoaiHS3DbXykIU412T5f6FIz7R3jmO6Jp
	3Hl2IXfLPbKaoqq9jBWAxvKDgs3MgoYa0W1xjSFrzpgo/JOqytQx+Mit69JI85I1oJTupon
	D272bChCe4/n1/x7gKWtA4meX9ZN157oNzY0mNoNTzTDz/N8Ot2zVLiQS7BMJ4Hp0sHlu/i
	1BG5p8Gfp8ZNZtE52rTOTpif4ySens4eHk1mcyVbZPl9w01emKpcKhewzIeq7iFlgAzc+mt
	d92sn3Uf/GwNrC6SvdlGPvmtQRjy8ycifibM0vjA4OzxhP6GjGhlEFVxTqSigKKUGb4lxXD
	jxAefrdEKDY+yh/t49Ft2H1jWSwTFI32SeJzqYVvggzzCC/z6HsCJApURGdSkkco0el6Ddu
	9DIR22URCEvoOfNrMQmkjBGz8FrJqWSymiIqJGA82mM62AFtaKdlnafedBylLXp5vRmyXRD
	z3624DdtUb0+zbJqI7FWsbhAsYugHCTJNENBeTt5Pn/Rf8NXWHiKImu7XGEtC0SGDnH4z5K
	yLVottoqbAP3Ni+odyFJyGRDDYuFwXPWfZILYlIHzG7bCjon72FSf3zYxyLmMMWm2obRXdj
	iY7QHVIw3hfP01BwPYlrqC8lhlk1kX4wyOaew5FOIdvWbLSmVoqemxJjYKht1osUjEZp45/
	1JL/f0afbKR+QuiIIN+3UI3MF6WMIGYp0kS8kGly5NKGTVbAG/UoV0e8iOlOqE65YqzPs7i
	2FO2WI2cOjFp5kwsesMIYsJ9Sal4yaAIi8IBA5PvDnd8TlJywYIBCJOn3BGbtBKzTVdQL9m
	1agvKpEyQXP8Z6iIjrWl9TdFtg==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Add the optional spacemit,fixed-sample-rate property. When multiple I2S
controllers share a common bclk, this property constrains all
controllers to the same sample rate. This applies to both K1 and K3
SoCs and is only needed when two or more I2S controllers are active
simultaneously.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
index 240d90402e4f..137070ad9eba 100644
--- a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
@@ -84,6 +84,14 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  spacemit,fixed-sample-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Fixed sample rate in Hz. When multiple I2S controllers share a
+      common bclk, this property constrains all controllers to the same
+      sample rate. Only needed when two or more I2S controllers are
+      active simultaneously.
+
 required:
   - compatible
   - reg

-- 
2.54.0

