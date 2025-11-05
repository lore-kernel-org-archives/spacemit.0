Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C1E18BBAE
	for <spacemit@lists.linux.dev>; Wed,  5 Nov 2025 03:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762314053; cv=none; b=R9XacKf3Eef7xS2VJnKMb2Z0Ggmoe8/HPE5j2xlInRZwUesSgjhCE0lDS3i0q5znVwBYeH1X4DJfR4VPFCJdhlZrjCsmePMwCx8tL/vpcRbq5zvC643qt3EP4Wt+2PqHm8xqz8UWXI81DE8WGFWu9pvomnRoL8P+kxBltIIEJBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762314053; c=relaxed/simple;
	bh=xiZjpDy3EAXqW0w4u5A4HJBPYdwJ/UmEUk25ogsrIqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sXmftqatKww1qoSa//eW3QJyoeXO6X+At1VkCa04Gi+iQu3A9CamXs4g1k45i51lFuM95TqTXYUcumNHruZndswBwLgpKbYXkJVgWJIIqFdZketu7jiXAiDH2x+oPeB1ggZiTYkJUL1iGCNFtYUBH92vsvNwXca0D3KLKNsaQV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=mVFQqNuX; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="mVFQqNuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762314047;
	bh=dLRrQ1i7ZuvOR380K25xa+U2XNncx0jGHzRRhBIJiZw=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=mVFQqNuX/5DoadX0InokTxr0roCJyHtBkWPJDsgHlXzc9txHMvnt7/3qMAVvWxjgB
	 PERdQ+XynhiFMfFkkTz94ibGxhR8l8vtx842+HWHQ4fvA5X2wSzzVQGs47VinKPThx
	 la/Av7llvSIfLGna6n87P9mSdv8Mhur/yhDlRlgs=
X-QQ-mid: esmtpsz10t1762313869t8b875169
X-QQ-Originating-IP: VTNhh+X1bUuazguRm/WjXFuDmMP9yaF6AZ6vdFDmMhY=
Received: from = ( [183.48.244.102])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 05 Nov 2025 11:37:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13385157105176269560
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: define all missing I2C
 controller nodes
Date: Wed, 05 Nov 2025 11:37:42 +0800
Message-Id: <20251105-k1-add-i2c-node-v1-0-d18dae246137@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIbGCmkC/x3MQQqAIBBA0avErBtQyYquEi20GWsINBQiiO6et
 HyL/x8onIULTM0DmS8pkmKFbhtYdxc3RqFqMMpYrZXFQ6MjQjErxkSMFEZvle87DgPU6swc5P6
 P8/K+H++XFuVhAAAA
X-Change-ID: 20251105-k1-add-i2c-node-df8b50b64ef7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Encrow Thorne <jyc0019@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762313866; l=648;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=xiZjpDy3EAXqW0w4u5A4HJBPYdwJ/UmEUk25ogsrIqs=;
 b=vxtr0o72DIl8ORZBrMCYT6gEVCmnr934Hy5aIBBkYpcIOREfIIbk7+cs1nn295z7OPFLEqRNi
 8HCFtKkb4AGCIbdKRl9krO/wrZXGBEq4ldHVkOdDDA7NyJ24o4Atl1s
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NE2KBEt5BD71eiIqaYNh2eZ04xRZ9bYqW8M+JVL+MIWrFr3HTLqcJ39r
	d0OQHkBP0oXAegb9dASvGy8Tadqqn5Ln+eBFnPuu4TpysQo8R2dbC7U2G/dAIXQWYVQQo1V
	vPGqBfDG3Z6V/+rurrmuoPIfvjUZCkYfL7u8gtq5pvEx9M/r/S71y2dCyCSBgn7FWNt0FEH
	Ik/hqO/YzSZTaseLpX8zq2P0L3PeECbrrxSpKPuvLSzQa0XGcwRDpQhI5HSnRtaxoTy5sRk
	guyTEsRKJwi1pVo1NT4kvbTRGKahImsnRKrdOhcAPGQo28Ajv0F2NshcYXEJJNVT9YfLjx/
	UF9wQMwkjw9M2+Fw7uoJ4JPQS+BWpF99OnniyqjFAE3TH5bgoXUgu/nEwHjAEcccMCJYrvF
	IiC8CgULpt6E0KQobA8PbpBjmj6WRqcsMtdUenXQEwukfBP4QbZTMTil3d0H3L4qjPhGE8m
	F4KNWUx5mmsZP5Iak5amcAOPcd6ChIh1VaESepX/N17YCqtS/mNlROgxLCfH7Xgf8SFE6Et
	3yGYG8TRLncNy3TFlhx6Z/gPng6xwz7r1+gj9nQkN8rMZWCLVAtPBcWHW7dke1fEgfi0MEs
	HEAK12kmALjZ74VOixXvioG8VuDF1447/MCamB8+DZBtNJxu/fDa5fjWwNotP9Ur6JwKlyG
	Or0i/UqDy3OZavIQhZWjMgKaMjvMv5/+V9xkOGiG/k+AZmyT7hVf+mqa9ZxuZWV2NY4eMLx
	sgwF9IoRtLXipWTWMd6ugosYKT2z9FdWM4p010mgFv0TIQgT9DceLkqD0Phu4POPjdjB3//
	sAjlPGk+ozQM8tcqwQtmzNIYsQ4Jn/upiE9c5Q3kRuG20S+1h5/Dc+UcUPm65vUI1iNnfYO
	4AUUJ6xHTFgZzU4kWFj3zOjHb07q0SJyXPXcaJdb1RgT2Wjt1nM42SkczpNMWYp7rjPmwkM
	LAoXkqeD9rJuQIaYFO/Ikx8kOAX9Zn+OCYDwlJJTYGkUZf4Kbvfq3lTlR3rtmCRbVrjPo21
	kuIm02UyPP213JFD48ZDYiYOSih5yG2nmTPDI3vVy3/wtkTbDC8t1j2pgzF5rvUrBdOKNFJ
	YzJOZHON2xHd8wAH7PjfYGNPJTFNLgxEMD1eEqM1e+sEyzpFQVsAAPS2t+0qEXPqg==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

Some I2C controllers exist in the hardware but are missing in the dtsi
file.

This series adds the corresponding nodes.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      riscv: dts: spacemit: reorder i2c2 node
      riscv: dts: spacemit: define all missing I2C controller nodes

 arch/riscv/boot/dts/spacemit/k1.dtsi | 90 ++++++++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 5 deletions(-)
---
base-commit: 17490bd0527f59d841168457b245581f314b5fa0
change-id: 20251105-k1-add-i2c-node-df8b50b64ef7

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

