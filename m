Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3130B200BAE
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 05:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544186; cv=none; b=eL5RCOyL3NkCAiZww/ntrSwn+xn7ppKt8iAxLssValFjoOHyJ3StSsJb2Ked/JYUsoBLE9IzP63s5+S6ZjrWEIye2LZxqqbJk9OCDfst7D/s2/Mky2E/JmloMdTJyUUzejr5f1Ddv8JJQ8fVqLjSuXrhlF0R4dZ0cfjrzfvz1wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544186; c=relaxed/simple;
	bh=haUTX3DAFG/sDExwxhYrFG+MpFnxNHgK9T898K4DEpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M8NqmvMxkPp/LX412dPtX3TsZ+tJbxNPdIeJdHqpfa8H2WK2T3trgJR8Eu9qsJQRZZSLbwToPTz5oySKSvfX2lYjFZ+qyR+zjgmc3zKyKNyP6I4PPiYz2UA+HbCKBCeBgjOwb4Td0hQbY7T3HK7pdT3g9yxlu72xH+2dH6+vhXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=UkXBKQqP; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="UkXBKQqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761544104;
	bh=VUROzD2Px2X01kMjDouTVlJB/FxOGL4kiYbsA/z/bxo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=UkXBKQqPb+sRn2eOlZ/SaX6PLSCmarWbCuIHFBNaPK00drkVp7i55hxqcxRJTqfj2
	 hBMGOXKSVYGyc35esXKH4FJ5z6BhWo9OKaNhu05XQxCw+3EZ48M/YpRpxd2rxyUUO8
	 vfJ9IgZO7I0jItBV/lQTRw033ebOjA+hMfU65n0U=
X-QQ-mid: zesmtpsz7t1761544095t7e2c79e6
X-QQ-Originating-IP: 2YYRSz8nfBT+0rkbxFwdGXPE9OU+8C/eh6y1Zk5miKU=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 13:48:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11408485327618603896
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 27 Oct 2025 13:48:05 +0800
Subject: [PATCH v2 1/4] mfd: simple-mfd-i2c: remove select I2C_K1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-p1-kconfig-fix-v2-1-49688f30bae8@linux.spacemit.com>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
In-Reply-To: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761544088; l=1235;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=haUTX3DAFG/sDExwxhYrFG+MpFnxNHgK9T898K4DEpw=;
 b=axT647NiGxsuB2r629BN37g+E++QCuCRTuuShun9jkeP1mUdrBRCaBuTuSlqcsYYlzjRaqazp
 X2VApOdw7riBC6daxcAt+BqIAk9j2LxxfeYInibW477iQkz438YsLYB
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OaUS/vBL36PcrxsqVFuqWfeo5c/moXnAmpVNEYaVqMP+nATRSDK9C1eF
	t9mgzIPgoYSsudFivUk9JYdINuFVlNWwdoE5zivFlgr7ckbc3IhrIJJ0R7yb/T7XfQyvx2O
	W4TdMLrhmFP56uKifi38U2JSA9fn4Qd31we1qRuHMy7i6QjmV5okwDI0DBRARRn4i0O4SOz
	IGgDpVUVZacRHcC1SGaDL3XuaRBwY0ELshiLMsP6wuUvCsISMZmXafsdkrqluqW4FF4nhOw
	BwbZqxEywhriVjeEXlllDblKbcK241fH/CR8yiE9m/V4XgK+dysyBK9dY+zuZivSGCnl8CG
	oKk7Egde8Bijy08zABdV56hY5VG4T3yyd8yojbFnsbQ+vgsIKSjRP3VDpS2yx4c2m1vogfH
	dgEXoTtWamBLkApo28f88iQGTjaWkAns8Wpm4wqEHDCUVBs1//WN8qsCDa9usuzniIpG6ee
	n6Q9JpaBi061OsJ4SVTifGLy572JS76egp35drCe/8a6TszW0eWIYQv4IfMSlln/502gdjf
	1Phfjprb4H2f8Eaaawpu5gDv9VhGxr/3smxYwuNTZlfZsw9PNkWO66KLHjEWh8x9lsfDK9l
	nvtm3xB5clHJwg+NuSLzI3pOS8nSnrxA9CxS6bnLI4l1X/j0jdcoy3z1r8UXbX1N1YaOsDP
	0VBoqw/zMsidralEQkBH6nClpz/DY9RZemKn0fBEjmmfKwGSdIz+gkcPs8HJLXi1NmluvOK
	TIl0isT/CK3XnxTWOH5cE79df8Yzqo/7KSLvQjHGMqqzltJsoVh3M8Qzbiz5lvlXRZgGc+Y
	IvRwU3KZyMuzkBfu9noKXvYwIZfmFVGLbtGJroU8FjGhb9hEljmhnFBekykk5QfO0e2mr83
	DOd2UD/EZmo1bR0P7taBEeGMrnU9YKf9JjYQKjPf+P6LtHNtScQdEuaf5+KHWQwfOGA4PaK
	nUw20FSo76inMixt0V/O+jHZIyjUxGrDssot9htLNkL6N7n9viza4KJE4hUqWZBhmlnFHoD
	PuhA4uT17RYxbZGavZJ6Yo7cpq4ki+KPgFZ0Of/cSxHTT+ar22mSc0gacvKXrXoYFIy7Xga
	yMJciNPuN1Ea+v3ag+PTHIEEnjnufRPYiVymTETermgc2S1W4XOwuAQLFe/ktJ7Dez7jcQC
	CrEi
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

select will force a symbol to a specific value without considering
its dependencies. As a result, the i2c-k1 driver will fail to build
when OF or COMMON_CLK are disabled.

The reason for removing I2C_K1 instead of adding a depends on condition
is to keep the possibility for other SoCs to use this PMIC.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510211523.sSEVqPUQ-lkp@intel.com/
Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v2:
- nothing
Link to v1: https://lore.kernel.org/all/20251022-p1-kconfig-fix-v1-1-c142d51e1b08@linux.spacemit.com/
---
 drivers/mfd/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..ea367c7e97f116d7585411fff5ba6bcd36882524 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1258,7 +1258,6 @@ config MFD_SPACEMIT_P1
 	tristate "SpacemiT P1 PMIC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on I2C
-	select I2C_K1
 	select MFD_SIMPLE_MFD_I2C
 	help
 	  This option supports the I2C-based SpacemiT P1 PMIC, which

-- 
2.51.1

