Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A2B22126B
	for <spacemit@lists.linux.dev>; Mon, 11 Aug 2025 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921160; cv=none; b=Z12vYd2uBUIRt7GJAjnS0ltfBljfE9KZa3ANhholeh/n68xlktkIqhSB0Fz+hO5ypynLdzMvteMrxBc5GfCwc/A2pLT9cHHRKKpu4E06nq17d1jhm5lUHQqRylgYjEne3C1X/oeT9PYPdRlkk92c8kdYrxRNlqCbqmb3YBYsR2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921160; c=relaxed/simple;
	bh=z70+6t8zQfe6gg2EzvLCmWTmpQzeFdqDzTO3JnB6imA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t4HQaqx3DGRfRetpkgygHnIb3A140LOqyTjvDBR2+8a1B//I4cS7LXhTFOofOck1bx8A5P/IHfIQ64esF6FJ/ytuU214UKesrUti1OLOuQcrlWWppS5zcubuZBdc3f3IJ1PK0lI5wP9H5sHGd5bhPwh/SkRco0lmFmIfvZ6wTcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=iTyTyCxz; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="iTyTyCxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754921085;
	bh=OTPCPLnwbS9eTCXGHSG2KsfDknKo86Vz6KTpbMSyVrw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=iTyTyCxz3heUH9IhYXra77U4lsrz3rhBL7PPMesV7TYvpAYUTD9URvfhLTP6N9p8I
	 tMucBl/ywW1rvsl25LXXMxitiwy2GP5dwN+VLizKlDrQpmbZIInML193vesBQNUznG
	 CaWBC7Gh6cpmBV83KXTCoZSIm7WIuedBZbrs9Fyk=
X-QQ-mid: zesmtpip2t1754921083t53edfe55
X-QQ-Originating-IP: H70G/aROUpW0T5k2Dez7TdHMWBIax7uH7QdV5lc7now=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Aug 2025 22:04:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12609989171803677751
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 11 Aug 2025 22:04:28 +0800
Subject: [PATCH v2 2/4] clk: spacemit: introduce pre-div for ddn clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-k1-clk-i2s-generation-v2-2-e4d3ec268b7a@linux.spacemit.com>
References: <20250811-k1-clk-i2s-generation-v2-0-e4d3ec268b7a@linux.spacemit.com>
In-Reply-To: <20250811-k1-clk-i2s-generation-v2-0-e4d3ec268b7a@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754921074; l=3244;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=z70+6t8zQfe6gg2EzvLCmWTmpQzeFdqDzTO3JnB6imA=;
 b=bYG/SvgS92wz4cP7uwrGWGWSfpZjCqtZoRlm9epxOT09HCebNp/gKHhdGXQcKNs9/1iJG9avD
 TIZ3sKcEehtDcYqfqNcfe8NrTca1918tLYJuwlkfZqeavdrl7FaSPOi
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NSUjTxa18SoDdlzvWqnixZuy+h5Duer9ixJ8Cga+ij/2W+AnxAGCPt4U
	tTWsDcplBWxaMMJ+XNi7uCU48DxRr+K2Ad0zHXNoVMdg0gXLEZiHBkob2kj+vmMUleZWWP/
	NFmtLAvpYxRacX3nRO8F9I3EwUIorUs+GMq4y7cApNb65ytDxmoDnenXdzDxw84qjbGSQTu
	iIWPwdQjAgdTCwdXvbb1+7OjfLJ7XIWWc7R8AHPfHtjKVk8L3CdO4J7JQecnGtPDptmc9LE
	kfL3/dJqQXDelceDiWY5w/KUohQPnI9kQa4aGcZ8gn4u1UYMFFwJsIW5blWSvQ09LmZ1emr
	T/R8UyiJtykRO3qihipoawrKMXEw1mcQa4Illi1ukNPS2Whmh4vuPi2ehTYBPuCA0iQS0iZ
	lqeFXIPH/eRqIlDdKx9ZfFvJMPyLySJO9mgZ9+bZkR9F+I1scFW/U23bJ1/jqag/4pcRlV4
	/cp1hhVd0DtUWS5mx8ZO2M+z1+NPWDMMiZfHLxQaT1FRZgcQ8liv/NN3dCNR8XaZjdkNjCH
	A5A8oEQy0uEADBF6/7W0UKRgMN826g03weimMRv1qTwvBddfZKCzW5FtsDnsrRWsV/WdL8B
	roWMWhfS+0U4fKW1j3/qJ1qvlRfxoZXuF/mkchjEKlL3+djqSqp8oJNqv8OMwpU1vKhOE/M
	vksBBMQEHkbvQXE0S9cqH4CDYpCcHqgurstyVVw3Q6fIRoONVn45b90p/tju5nn5vUWSfL1
	hb5Xk4peSsx7bhtNrg693r2fmx8JRoOdCdnEqzQKWVaY8WxKBAK+5D/IfCyRsR/lclE6EGu
	oTvjLCfFt9E2vKH3Jz9fKy5eeUZ4fGsKWgDgFOHGFWOFkH3uMM9emuhksaWgvoQYLE3LTXw
	SquAp86fwFtiNQbKlWUVy3PQ/SX9JrhSEZJyQAmECuv8rSyDpVazlq4fRL+nvelYaECjz03
	P57MGHRKqHTF3SeXD1WEKbRwpbJGV3snOd2fl4SPsjon+9JwBGm+OI7pXhLisIiZRMzMERE
	P0BNalRNhvOi/qaoe84LyM08Ao0Ab2pFcKDLkG2VOfpjwUeaIoB2asECHyl2ahsCCKvDsyW
	fwsF9sSxTFY9HMTBopF3C6Ubiuvo07eiMMYRohZ291jjBS9/qzTS4k=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

The original DDN operations applied an implicit divide-by-2, which should
not be a default behavior.

This patch removes that assumption, letting each clock define its
actual behavior explicitly.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu_ddn.c | 12 ++++++------
 drivers/clk/spacemit/ccu_ddn.h |  6 ++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
index be311b045698e95a688a35858a8ac1bcfbffd2c7..06d86748182bd1959cdab5c18d0a882ee25dcade 100644
--- a/drivers/clk/spacemit/ccu_ddn.c
+++ b/drivers/clk/spacemit/ccu_ddn.c
@@ -22,21 +22,21 @@
 
 #include "ccu_ddn.h"
 
-static unsigned long ccu_ddn_calc_rate(unsigned long prate,
-				       unsigned long num, unsigned long den)
+static unsigned long ccu_ddn_calc_rate(unsigned long prate, unsigned long num,
+				       unsigned long den, unsigned int pre_div)
 {
-	return prate * den / 2 / num;
+	return prate * den / pre_div / num;
 }
 
 static unsigned long ccu_ddn_calc_best_rate(struct ccu_ddn *ddn,
 					    unsigned long rate, unsigned long prate,
 					    unsigned long *num, unsigned long *den)
 {
-	rational_best_approximation(rate, prate / 2,
+	rational_best_approximation(rate, prate / ddn->pre_div,
 				    ddn->den_mask >> ddn->den_shift,
 				    ddn->num_mask >> ddn->num_shift,
 				    den, num);
-	return ccu_ddn_calc_rate(prate, *num, *den);
+	return ccu_ddn_calc_rate(prate, *num, *den, ddn->pre_div);
 }
 
 static long ccu_ddn_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -58,7 +58,7 @@ static unsigned long ccu_ddn_recalc_rate(struct clk_hw *hw, unsigned long prate)
 	num = (val & ddn->num_mask) >> ddn->num_shift;
 	den = (val & ddn->den_mask) >> ddn->den_shift;
 
-	return ccu_ddn_calc_rate(prate, num, den);
+	return ccu_ddn_calc_rate(prate, num, den, ddn->pre_div);
 }
 
 static int ccu_ddn_set_rate(struct clk_hw *hw, unsigned long rate,
diff --git a/drivers/clk/spacemit/ccu_ddn.h b/drivers/clk/spacemit/ccu_ddn.h
index a52fabe77d62eba16426867a9c13481e72f025c0..4838414a8e8dc04af49d3b8d39280efedbd75616 100644
--- a/drivers/clk/spacemit/ccu_ddn.h
+++ b/drivers/clk/spacemit/ccu_ddn.h
@@ -18,13 +18,14 @@ struct ccu_ddn {
 	unsigned int num_shift;
 	unsigned int den_mask;
 	unsigned int den_shift;
+	unsigned int pre_div;
 };
 
 #define CCU_DDN_INIT(_name, _parent, _flags) \
 	CLK_HW_INIT_HW(#_name, &_parent.common.hw, &spacemit_ccu_ddn_ops, _flags)
 
 #define CCU_DDN_DEFINE(_name, _parent, _reg_ctrl, _num_shift, _num_width,	\
-		       _den_shift, _den_width, _flags)				\
+		       _den_shift, _den_width, _pre_div, _flags)		\
 static struct ccu_ddn _name = {							\
 	.common = {								\
 		.reg_ctrl	= _reg_ctrl,					\
@@ -33,7 +34,8 @@ static struct ccu_ddn _name = {							\
 	.num_mask	= GENMASK(_num_shift + _num_width - 1, _num_shift),	\
 	.num_shift	= _num_shift,						\
 	.den_mask	= GENMASK(_den_shift + _den_width - 1, _den_shift),	\
-	.den_shift	= _den_shift,					\
+	.den_shift	= _den_shift,						\
+	.pre_div	= _pre_div,						\
 }
 
 static inline struct ccu_ddn *hw_to_ccu_ddn(struct clk_hw *hw)

-- 
2.50.1

