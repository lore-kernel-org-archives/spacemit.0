Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A9A2E62D1
	for <spacemit@lists.linux.dev>; Thu, 25 Dec 2025 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766648995; cv=none; b=u80t5aISbEJY8yQMOlroKSNOKDocxsEVO28HKbT4xxHbS7uwsF6xajM7wlc+ZMT6Bm4g98dFmOev14j5rfXjc5zYBwSdZ/gdnEX8LZRNrJBKPyfupSbCIJpbNlKGxWv5vkEzGAMYlXENi4jgofHt9sKRt7aHEKiNFJ9GGUQBJXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766648995; c=relaxed/simple;
	bh=tbbmEGblJd70gj9mVMO6LikHfMNdKYXKtiUuTq3LKZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXr1XZGMjMRLcGcGpl3Trfnqn2DnkAs8F1D/3i4b+ktKPw8aYAN/owklxjRqS2pXtzdy/DfgyIOtuIZ2ESPkK65JdbSMCNVWtz+U8enQd3g+tGfr5hMIbOA2vxCN+Dp+pFU55AiOhX6Le6bsfa/h9I4y28+6h8I0Oc6oPE/byC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=tI6GV/z0; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="tI6GV/z0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766648929;
	bh=ld7avvFlqBh+Ra3zRZdP1viy+VmWyIrA/gK4Yj0CcDc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=tI6GV/z03oB3p5MZ1ZXA19VaIjwhhbVFGQSHEDu+UjNlhuk1K+jrubnv0VQMXY5WS
	 MtBW/uLAWvJuEbPvg2gTkcynwjOaeSK0PCB+mx3RB9SlFlmIS8CSOhwTKJFoVgqv2H
	 tAxhrJzW+V7kjkKs0ibBfJmWTzO5J3v5oAMY/Krw=
X-QQ-mid: esmtpsz10t1766648920t8f7ef5b4
X-QQ-Originating-IP: pntZV3xKJChw+zzDHE8O8xkD22p47KAnde+hzxhEzB8=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Dec 2025 15:48:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5483703246839209584
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Dec 2025 15:46:33 +0800
Subject: [PATCH v4 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
In-Reply-To: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766648906; l=993;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=tbbmEGblJd70gj9mVMO6LikHfMNdKYXKtiUuTq3LKZs=;
 b=v/CslR99FmS5Mu4A6LShyctnZdoqPZ7rApYqBGfTMp/mjWlTQqJjtyZ10dT6/qSCL5+iMtk4j
 S71svKcNp2ECoaFGrJdoS3CNWxzGQQW+RUHhLPNne4MhlX3WvAlwZPe
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NlrfLQhmr2s57OcrrgUXV9Sa8BCKy8coW65idj//sLJCWI2yzZEcDG9N
	PwWlmBcWWyge79nBvEnAQ1Mi7H7IrEVc738/nV3FYEZmx7uXz8fUyKUOin+i+Z2whV1c2Pj
	nnCOfLx+88F30FjY4TEK6S/OO8uwXFnboGUzYLLX1YeooxIinnc+UCpoPxDy366J+aWso3A
	9otM1KZTP/UB0YvDM/EH8qmrey8/weWQXzb49HrIRKdfWSZpSTbsmJaL3Z/5uT2O0Wf0XNy
	/JsDHLSiG30A64dkmaBpMzTMoR4wcn1FIFk0CtZJe5Eh1Ab68lRqi7NxuoNujMNBQEJrd15
	Jc/dXqeQy+F27Y3D5CnDF4sXfHVAZieYh1nkAKNTJO7IYK5fUfm+Xfa8IvSUMkDX6Div2ro
	x0KlqqF7wFeSar1TXSzhinMDqKbirnaEAv0JkWvNhkN1IORW7IHKobRKXSm285cSP28efGa
	AMc0Rg7/c61EjMnVahwCAujqGCcLZmEN/tIGtpDWe9dyH1vkgZkO5RHt0EMUkMhgACT9o7i
	O1xUBashxrGaFWmhULaOuxyMjI3I9tr3ZwgBDosyDNt9kH04EIz9w/F4MEx+xLAc5kVs0mo
	dY7bPo3elp02hvprjGpQ8CgEYNhUWK4gkhQWWw3H5BzxbedbswCOzupr1GoYM0/BO8ymJuV
	PvAIe6XFHXQXTY+V4/07gGkpNq1c8Hv89ebTjCV/0tfw6hAoJC8D+6F/KdQYVO4xpZaVyUR
	juz2CZ8+yMRvTmPD9VDVUGmlTzoKVQfC6gDkXX3UhyB/fjs2qVh7atky/ONM3s0f9OE1WEN
	ilDgsjaF+wCpWQnapljwbcGBtkttGoMG4op6atxFG7VIkVRybyBTo2tGtOi/Glr3Kn/6hDT
	t0v4kYavNlgwmeH9B8LRu5Dn/qwR9kIz4C7JoJIfo/slRR4oMWO0lrGNRruIIRMKDDrgEGc
	guRw1iFgwq9ToLdM71RsEefyF2LaSJJd0fduLeU2MVO0fd3t7PsgdW6Nky09j9BjpIMm8No
	ggi8GwpM+RFEcrpsIbENmH21vt1C9buj0P5Z6AQPr54GfGSgJ0PFBM7aLXd78DRjagZblwi
	Q5aoM/cK2IEt3SKBB+SmNLDypKdbqL8IH9GFV1Q9Tp/r6Uq6IwKTkSxFDLlbqZVF6l2z+eF
	42VH
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
caused it to be built-in automatically whenever the PMIC support was
set to y.

This is not always desirable, as the RTC function is not required on
all platforms using the SpacemiT P1 PMIC.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
 	tristate "SpacemiT P1 RTC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on MFD_SPACEMIT_P1
-	default MFD_SPACEMIT_P1
+	default m if MFD_SPACEMIT_P1
 	help
 	  Enable support for the RTC function in the SpacemiT P1 PMIC.
 	  This driver can also be built as a module, which will be called

-- 
2.52.0

