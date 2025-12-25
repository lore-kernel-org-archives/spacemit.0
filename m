Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BEE2F39B8
	for <spacemit@lists.linux.dev>; Thu, 25 Dec 2025 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766648995; cv=none; b=LPVGL6XpKL3P6ZmyN8sgxE/F8DtsHGun9tmX8RKp42YhUeVmndqxWBls9imVQzRnftXbOH/kCpx+fjCVQg+nEi5ifPx/XtTLNXpbgQ0hN9OcUP+o5tq1cW1H+lrddH4e8OKJyXTbmBdaE2MPfUxKlkSIfqywH5LIOmwKyG7gT68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766648995; c=relaxed/simple;
	bh=iMg6wwDsweWCVKfGU6Yuji1Fc0E8bijBQy5ZTPi76/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PdEBq6POFzTOl7MZ3twrTK92teYd+iRzo23kZrjMHIaiX3ujoDneyFq/EWiFbYGUAlLtANbOGNqCM9h/pSsj9WODrhAgn+gzrK2pIP0EaPdoK9+0MqJ07JR+HAOj3Wregcb7AcjUyDQVG9lgydkRKYJ0BCbv7kuJJL9ytO9nG/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=JfFmbyQY; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="JfFmbyQY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766648922;
	bh=Bt9+AAj1WTdGjnYn2EX4UcCvWfJz1QvVTOHob6fVY4A=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=JfFmbyQYvwKTx0/VRKjRwVDqfMdVPGGlzfz74BJATmJE0F7zwFx06G5dKkXEXz0Of
	 ABkFRP3dUC69sSj0oOQDt/e9OjGOZR2OmzNU28Rxn1/jlg9JwLryf78HH3gvP9kR5S
	 y5s0tM5upefhgXggxVyt2MGudqEo25Gt2D6NCxto=
X-QQ-mid: esmtpsz10t1766648913tcbacc2ac
X-QQ-Originating-IP: 3r9bwkTFX1T3U6eigVRSJNklhH7Vc2HXfb9poEvfdc4=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Dec 2025 15:48:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10865565144095889897
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Dec 2025 15:46:31 +0800
Subject: [PATCH v4 1/3] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251225-p1-kconfig-fix-v4-1-44b6728117c1@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766648906; l=1771;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=iMg6wwDsweWCVKfGU6Yuji1Fc0E8bijBQy5ZTPi76/Y=;
 b=wi4kT3hFhqwpJwe5zdJD7BDfxtV7mw+eeGP0USovdXh522DDsTRZ6aTn7PDACALex4Jj1EGZM
 1er6vMpLut/CwqOy8VimKPIom+Y7NS8OivrC7pJsJ8BnVmVjD/e78ZG
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MIssWYSUO/yFF6u6vDNwYRdCj18r1eMp/OdBFzTe3ocgJwCITLFxc6vX
	gTzlhTes5BkRTLeVjHSlioRHYGIMbAJ34ltyctVnpHQl6MqdNJ3Uvqu6SDPjb5QJFZaKGIR
	kCg2OvoYcO4vDAP7cZ7Be8clG1AYqWe67phYmNMyi1ASF3DfPnksuizxD2tG09AUZ7MqJda
	yJieARRWyBz+8H4YUlqY5wJ/i72ycl1wkbmDDIW9zLfgYxQyFjBfQ/41219OYSY85oVIpsD
	yEWCTh86GYHPluU/Sa7Jn8/BNM5TDu/OLMzi2V8Zfpo4pC2HG7TqIt6cECWfXG/7om8AHKp
	LrpKLDV5Pe2pQqP6jlV1v0kXij0QNTLBXOdtdoGvY1xT23RO25tbG3RQLTWX4cRUgGoEx02
	OCWcJyP3VHQhG8ie9nv/mE3oowlnR111LBJCpllpOzpZBDrMJC2LdHrqTlnTiH4RbVk0Pl/
	M46B2YaewlJJP3pVIHAVVU3rh2/tqNBGN/fmiMoQbwBn3v2PkEuKd+EOTT3QC87Nru3OGuE
	gQOsuU9l+IqdkoNJduyrFOQ9DkLceLVmt/borhi5jPipltaiC4U7SDt4XTFOk6vyeklqmpz
	E+/jKoJ0iyyC/YUwItEjMQpK8nXQy7VB/AfWTEDRwcDBM2YGuW9tEr50f6Ru1PkIA9STfzb
	2RlG7elyYo1swhltQ/8VY1s3lXxFH/RVZtnEJcDUonI5fMv4sgwTpg2RnJTV2pr0OSK6r9d
	5INyOFxpRuSa3NgHLbtQi8ndld44ovJSbc7u0XGy+l+jXMFn1jFsXTyicL6+F5AMonChHsP
	ioDsnEw9Kyu1evKRjOMOJuCF77Zn3Gr/JL1bBE92lOcrFt7SnnIdGNi+UGVFoUtYXDOB3v0
	YOgiQs5+H9zm4FbnLJBF60WCA1mysrEsQE2rdzN4LktFLzfIVP10DulYFYoiGZhWW6ktSkd
	G/eYtAubcBX41ud5mu1YIDXWNzmAnDl4D3Solho2R3VuO9J4zEuC24bCyjQoFydgzGA357k
	ZuPB+5l5HeyAl8UiPPePDKIejaplv69wbsvKQ/fHSRsco/9FdEHyMaPRG5RER8cWhcxyj4k
	3TYEFjiEuCt7wJyXfg905skav2WOpC1+tzXpaieWCM5S0H6UhVQRfhPrIlH+WAF+yQthwi3
	BUuKfKSg+MSayz8=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
does not always respect the parent's dependencies, so 'depends on'
is the safer and more correct choice.

Since MFD_SPACEMIT_P1 already depends on I2C_K1, the dependency
in REGULATOR_SPACEMIT_P1 is now redundant.

Additionally, the default value depends on MFD_SPACEMIT_P1 rather
than ARCH_SPACEMIT.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Change log in v4:
- default m if MFD_SPACEMIT_P1 instead of default MFD_SPACEMIT_P1
Link to v3: https://lore.kernel.org/all/20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com/

Changelog in v3:
- modify commit message
- change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
- Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com/
---
 drivers/regulator/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d2335276cce5ffbd500bbaf251d1761a9116aee9..b51888a9a78f399a6af3294fc19f60792576332c 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1496,9 +1496,8 @@ config REGULATOR_SLG51000
 config REGULATOR_SPACEMIT_P1
 	tristate "SpacemiT P1 regulators"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on I2C
-	select MFD_SPACEMIT_P1
-	default ARCH_SPACEMIT
+	depends on MFD_SPACEMIT_P1
+	default m if MFD_SPACEMIT_P1
 	help
 	  Enable support for regulators implemented by the SpacemiT P1
 	  power controller.  The P1 implements 6 high-efficiency buck

-- 
2.52.0

