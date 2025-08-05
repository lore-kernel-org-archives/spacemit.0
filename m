Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1A7231C8D
	for <spacemit@lists.linux.dev>; Tue,  5 Aug 2025 13:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399003; cv=none; b=cPoVEA89YEGy4FxjY3XUlYk2F8x+s2Mv58aFIufT6a/F8ivHP+X9mT+kNf0tpyjAxXSlxKLTSfeaMYmAVz7sy4JpbRTPJ2nzBWil76vZapanXSO7aL2oSSjpf2H8Kx/Ihqgr5uhR4mKnHO0vS2fdpjN1xqBhLAEGh9HB/EIH80c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399003; c=relaxed/simple;
	bh=VIogLUVb+B9m33ED7b0OC4lYwaKwU3CoXfrEw+uoTVI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=itsB9xYKys1BbcvD3bXi2Q847j5tdIL7dWGs9nj1FNlZvJH5ub6pMrnwMeYu+54j9iVmru6PICQmhL4wtDq+ClKC5afSetJ+PR9PAOs6JoQhqRnwUJRzdL+qu6uipMSB3bahsW6eV/9APIMo5uqoZ7GXY5f4EWxTdLBDqxaGWW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=we9Yg2JD; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="we9Yg2JD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754398893;
	bh=2k7eM+qFUJaAUiL35OCQZ3NGlJIOhG5UcTKZAFRYQc8=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=we9Yg2JDHhYW1mMObXvpo25zpkaeKeYaNpNm+KGa1fOg89uu4MYZ9wATrURiiYOOy
	 +zilDFA6TTZn+Ku6QcSBf7uiOgM2SNZSsRLfCX107wgT00aU0WyDUZ/9k8qAbXD1vX
	 gSApb48pLnOsDQ01axhmJv9tqwn92NsV/7+T4/FY=
X-QQ-mid: zesmtpip3t1754398884tc0db81a6
X-QQ-Originating-IP: Ak9NAqBwWS0g1NX2QCrCb7EK5+lEsm3U1YdqNdNuPnc=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 05 Aug 2025 21:01:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1081721539837443634
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v4 0/2] clk: spacemit: fix sspax_clk
Date: Tue, 05 Aug 2025 21:01:08 +0800
Message-Id: <20250805-k1-clk-i2s-v4-0-038181284dd4@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJQAkmgC/23PTQ6CMBAF4KuQri1pB0rBlfcwLqCdykR+DFWCI
 dzdajTByPJN8r6XmZnHgdCzfTSzAUfy1HchpLuImbrszsjJhsxAgBJaan6R3DQXTuA5pqDBSVd
 IVbFQuA7oaHpjx1PINflbPzze9giv64cBWDMjcMHB5WgdJras0kND3X2K/bU02NItNn3LXt6Yr
 I38x0iCoaxWunACAPSWsfu+kci/LrhMKWsrYTK3ub8syxNN/6CXLQEAAA==
X-Change-ID: 20250717-k1-clk-i2s-e4272f1f915b
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Yao Zi <ziyao@disroot.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754398873; l=1952;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=VIogLUVb+B9m33ED7b0OC4lYwaKwU3CoXfrEw+uoTVI=;
 b=lAgY2AmtKu9ClVpMR+5mFhfE5JbN6kb2NJ1/Xg/uQrvsXysInoA5aNHxVmfBnNPLjXWnnN0Za
 wNmNDgfWny+BVjOw4/r98A4rCALssgEEbJSwIwO4bKpPosZAyOd8/Tx
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: McAU6u1o6JqZq+NzFtX3o/sI5WAEwZI62D7TSsOAae06aw063aHmfBkp
	9TW0+XPP2zcPPNyd8Nr1NTRFMj73KTNA1/wQXo/dDni9AUY2sX5yPg0InQz3UWUz3f7Hi7P
	Sgm70tYAoNigvYRD9U2iCdR4gcq/JpGKrSX0mAFEROJBUW4wjeWxBIo9W0PtRZf49boTGy6
	Y9aeqGrHDD6hERbvIcCN9ovXtL7F+DyAEj8jQBriXMMZGx+fuACyCfaEiyb5zYKdFA3xWNl
	P1u5IGwtFBicKhHnmOgP5tKXQ8PxUnr69ZmANQqfTOYdjCXWLXaNBvTNy7gefBxLoRAw4uB
	e2GnrCkSXUW87+KcXBbRTMvmDECTqih+uMseq25uetxkXO8yf1Z0dwE8qOlLVar5N2+htrK
	pQm+JESY1lHnEFoA25CtHivNd6kWm+7vN2GIItx+Xtpz5xs7IviWccJE+qIeAG4CE9Pr7Ld
	5QkUcVuboDa9fNcmdjVWPW2qcw0uieAeejMwFJrdHcHBVCl/rWZIX0b1Szv45abFsxwuI/J
	C6G8dU9HZTG+C76bCLFfKj0Z0MSj8cYgGaaoxYT3jfmLcYzgqrv2yWt9XhE+ENID5VEOkYx
	gLLDbIPkApovnNWuwLHtKQWnbgkn2jp7pR1RVh6V6TNvN8IhXPQSF8t8vZmqYoSOx041puj
	7eQX9j2lSgu+yIytb7TkEsJNEYJqbNDhfGwh414pn2mCbwL1Ku7opJPvLW/1El/OY5ePlOi
	Rt1GquXtiaVvG1ZG1SsuCFasJSqkU0xhpE4h+QSpYJCTefbliTj50H615nVeZibjZUqSeOo
	MPZIA5SZIjm3JRK31fsCL4ymFwHdpp5ixegeR91ZAuFJV9WyQMPcuzFDCfo+EUd7oCuME0U
	btKZTnrtYgK5rospLvUZ2d3LPmBm91wKAlkeojgV2c+jLoXdCjgVXFypxA5RapEMxI0DBn6
	dWUTctf063Nvv/G9h4X07sI/EpoHpibaS4a/aJelx736M4wPbZiI6FwBnoKjl+ndQk4KM++
	eWhee4LaujceYnlpe1kGcda32CvK7SfBxQ7ciAdQFxGMGApPQwGQO09IZMQWXKj2DlbHIVz
	4z7NEv81fUxxQ3qPkiYQtEYunIdvwQD41swYoZ4/U3sBUuXWnoS4t9sIhf7hG+Kz85AlZxT
	nTq3SfvswvUINzdhlkHy8yJedQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

In the SpacemiT public document, when the FNCLKSEL field of
the APBC_SSPAX_CLK_RST register is 7 (3'b111),
which is a reserved value. And BIT3 of the same register is
a reserved bit.

But the documentation is incorrect. In reality, the value 7 (3'b111)
of FNCLKSEL is not reserved. Instead, it indicates that i2s_bclk is
selected as the parent clock. Similarly, bit 3 is not reserved either.
When FNCLKSEL is set to 7, bit 3 determines whether i2s_bclk is actually
enabled as the parent clock.

In all other cases (i.e., when FNCLKSEL is not 7), bit 3 has no effect.

Importantly, whenever FNCLKSEL is set to 7, bit 3 must also be set to 1,
otherwise the selection of i2s_bclk becomes invalid.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
I sent with a wrong email so resend.
---
Changes in v4:
  - add comments
  - add tags
  - Link to v3: https://lore.kernel.org/r/20250731-k1-clk-i2s-v3-0-2f655ddb0c6f@linux.spacemit.com

Changes in v3:
  - Fixing ABI-breaking behavior
  - Modify commit msgs
  - Link to v2: https://lore.kernel.org/r/20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com

Changes in v2:
  - Use virtual gate instead of new function for sspa
  - Add Suggested-by tag: Yao Zi
  - Add Fixes tag
  - Link to v1: https://lore.kernel.org/all/20250718-k1-clk-i2s-v1-1-e92c10fd0f60@linux.spacemit.com/

---
Troy Mitchell (2):
      dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for SSPA
      clk: spacemit: fix sspax_clk

 drivers/clk/spacemit/ccu-k1.c                  | 29 ++++++++++++++++++++++----
 include/dt-bindings/clock/spacemit,k1-syscon.h |  2 ++
 2 files changed, 27 insertions(+), 4 deletions(-)
---
base-commit: 733923397fd95405a48f165c9b1fbc8c4b0a4681
change-id: 20250717-k1-clk-i2s-e4272f1f915b

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

