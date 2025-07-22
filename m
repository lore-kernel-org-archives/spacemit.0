Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AA52E6D09
	for <spacemit@lists.linux.dev>; Tue, 22 Jul 2025 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753169915; cv=none; b=HvkV2T/zU2FetHIskzWQHFl0uq6jkLF3oxF5gY2eTjNseafDXUmCuqTFuvodCb3bUGRGfbNqAtusK2DNmjhrn55mb0vuKYsu5WVDlqZq4I8Y531GRm2B2RI6n0JpSKEyfgr0TLfZs1bMB/XeoUHyvBxlRtRCMEhJYwL0i+62/Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753169915; c=relaxed/simple;
	bh=1EK2TQsFCA6A4Rh5b5WVVEqCK3IkUuA1s0DimdzqhBc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZDEYi7I2t9lUtbEh422Cy/laIPH53/nm9qJ+2h5TJXE2pJmll61GgOKv4OXVd6A+6YPbcngoChMJJP2W+R7KE38AyRQNctbDIfcUzyT9p4aer5UWWnf2puUbAJq3Q2HCRWfpsCcaBnbSQ3uoaFF8xVxv3iVXk/XgjlgHscgcdGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=QqIcQcro; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="QqIcQcro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1753169832;
	bh=pQ0rrp8kQpeiLV2GXPkNYYVhyLLgxjuHpx2u2oAf54o=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=QqIcQcroOZTMKAHy7RDR9tRVZZOMqNgk4SXU6RIQLa5v2LooUY6pVe7kw1mKEZoPz
	 BbmuuPzwU/qA40WdC//4Q4PRXHZgtV49DIBjwnXwX9xV1cp4sbUqKna23oWSFvnSUf
	 KJtx/Tr+Awk1b2wYdX7ng5icGsfOmRI4v0+mUUcg=
X-QQ-mid: esmtpsz20t1753169822t9cc06cca
X-QQ-Originating-IP: o/6alvnXRlytoxVwMjxbpu188hGl4Y8IZ2m7pvs1yY8=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Jul 2025 15:36:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3472028324407458743
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/2] clk: spacemit: fix sspax_clk
Date: Tue, 22 Jul 2025 15:36:29 +0800
Message-Id: <20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH0/f2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDc0Nz3WxD3eScbN1Mo2LdVBMjc6M0wzRLQ9MkJaCGgqLUtMwKsGHRsbW
 1ADGwC4pcAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753169819; l=1511;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=1EK2TQsFCA6A4Rh5b5WVVEqCK3IkUuA1s0DimdzqhBc=;
 b=CTQULKaJ7/EjE652+6Wzwt9+vLnkF0x+lT+4hZ+GRPFNvj6L07fYzAjrjnWRajGOzpU/Xx05C
 VFmJL1uAPltA3TPbGZ8DBw0dpsEJhVQKGmbHAqDsmGLU0W7P6pUmkXa
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NTQ66HfZcHliPHrfIBKRpK7F2dihCzcQtXunHgRUvb3k2Z07MQwYgWLd
	j9PnaTDTBDO2+74vGbbeQPsXDc4FtNLO9FtLIQxK9JLTv4YVRt+IkCxXw7H5fZmikT4hx0u
	gQKylacha4f55CKxtUzfElbra/WSSaITRzXwYVO8lpihryqlrXxrn/bp1QUaOMX/QP2ds9f
	E3aGGzfmn/+sNrCFiRaV3ddWqQy+arGWsAe+mbHeU+1IWEKoDeiWLWVqMEgqf4wjzCgqW9u
	ZA9IYoo2aYqi0EonbDhK7HwRxaTfmYJlKbNg1TUHtoml9+rsnNMAdYeHpMftq+JeY+2941u
	/pJso5ctLPL1s//45ICUr/AGJVwNN+mb7AZBzWOpwN4ilzF8JSFIIig6YVp8kUekROog9b5
	kfzY5urBp/p2oFXirUmDtEU8qo2aRDTILZFKBQ3n7NbpHZogF+vVeNPmWI5E/B16GIVVH/6
	Wt+yAYmMTNVFBNLMow/ZTQsOXM6CABBa9p1GBq6p/dQxCCg4obpR+xqwFTqM33jVsqA7YgO
	qy3ZdkfCVzcl5Vgh3XVyJ5G7LE9w2f0iTY6/CJO79IbGYQDbrCjgyJqMGX7gNR/y0iiMoRN
	ikIFCdTLapJothtm5SOVCm6GphbOpoV46AlB6DkQlaSCRCs3wczkXg9csoiUb1jTJzODBny
	c9JFAB/Zsk186Sd5pGkUEN8OkQvUDP79xph6h8txBsPTsbFCoMRGgVy7h1DZNDUVOY67yFj
	DZu6olkaG1g3C4DIPfoGH2nBXEYygpvrgtPULHR2y8oL/qLFCM/6sMsBIsby5Th3uO52PeI
	nJ5v4IhuiZg73X0m4dMw8SwQR/xs9WbveGA0dPWemUB4VJ5k6+INTN5KLmGUywdb42NCxt9
	fUwZe2hakSSt7dPVLLMvj9yR0ucNZcsFIliXqvjtCgpEv6+QJidlyQUZwpKUKXKQYXINE8M
	E744lO8ZdbC2+Y/L/p2BRxlIHvKjOEWnpPTQUT3bfotV+5O08/K5pgXOBqhi/1/GqLYcHhY
	y0t8rKAmMmDgMKZnn+2B6HLVZA0wbNRj0fmdAtngIhsSf7uX+hoBPQ0dr7ERDVheWWGoYmw
	db6wiF2/Lb1vtR0mUlriSvVXSMVTsym2+BmsiPkNyQW
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
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

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Change log in v2:
  - Use dummy gate instead of new function for sspa
  - Add Suggested-by tag: Yao Zi
  - Add Fixes tag
  - Link to v1: https://lore.kernel.org/all/20250718-k1-clk-i2s-v1-1-e92c10fd0f60@linux.spacemit.com/

---
Troy Mitchell (2):
      clk: spacemit: fix sspax_clk
      dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for SSPA

 drivers/clk/spacemit/ccu-k1.c                  |  25 +++++-
 include/dt-bindings/clock/spacemit,k1-syscon.h | 114 +++++++++++++------------
 2 files changed, 79 insertions(+), 60 deletions(-)
---
base-commit: 733923397fd95405a48f165c9b1fbc8c4b0a4681
change-id: 20250717-k1-clk-i2s-e4272f1f915b

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

