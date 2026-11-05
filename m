Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867382;
	b=VADQBxuzJE2jp5AeidsLIKRXd2bqJneco9Jx/oJ0gxa9M7clt5kP41ol5uox9YM8hdMy
	 wFTIjua0Hb9ZH95WUqmYlo9MfbeC2MLTUHBMzwZyJnqXPFHg58zt4XW9v5S3QOm0cxTPr
	 QSj6AVk/OxusdX6Wy1bnEvPR414Fave9JpVFBtM+CYIxs6gFYlxAHqILfVs3DLnpwzdHt
	 29V6H6GRAvviEEIvYuhINgKpefqoZjs4I3NE8PzZzxjl27vSmZTbzm7jl+0PwxI7IavkL
	 dapfjrnao6YDdCGtR4ywE6IonfqCzPmL5VJMSIAgLdb/KcgbWm+uJKQZJWcNVxq70vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867382;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=sPfx+l0EOFGsE8A6hxIkSb4d4vAjU6pgHNaF0pOo7Z4=;
	b=XSx07KbEB/j7oN89tJaQ9A31ppy27bHePZzZ2lm4tuvD+1t+d1JGOibVRC8uB4AOnasa
	 qyWREwP7CPjDJ30NCUXU9Mqa/97ZziPP5QKSfMKiLOg1u7elbGdme9ihqQDysfpvwZx5T
	 HMD0tPaXLNExhB9ajjbScVL4LR4AJbgGA2tcWebHfbEBqCAKInSHQkQPvjV6+SYDeBOvX
	 0XKnf2Yojcz2gWRuZcfEUU38PnKwVU06OhJ3UB8K1KesAbkDeNf21wvLT78iZMj2QFaCs
	 xAMKvvpvWPkOBlcVSWwF6sIe/tZTjqhpHIpB5mhT22dOKnpjFuIlGRJZpvZ/qLVPseA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ZxhCutnj;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3FA606A31B
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 08:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A3FA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ZxhCutnj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867371;
	bh=sPfx+l0EOFGsE8A6hxIkSb4d4vAjU6pgHNaF0pOo7Z4=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=ZxhCutnjoHntZzlj0fXFopOOR2rih9iWwf2EAdkacwnYzHUh39MQwGtVK3fp/h+Nk
	 SVYQ8TUNAwQz+gPI3dybjJH7F+hgqljJyDQMoy2IOBtsM/sZnw+oCE4++9Ei8f9Vl6
	 GHUy51L2M60J47a3rf20jPSnpt6Ws8W311zVvm0s=
X-QQ-mid: esmtpgz10t1793867369ta4ea5eb8
X-QQ-Originating-IP: y4ts5EB/CBr+rDQhfQ9imstg/unhgR/i06rQiSt5Wgo=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:29:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4689580742165798105
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
Date: Thu, 05 Nov 2026 08:29:25 +0000
Message-Id: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBBA0as0s3YSoGkNXsW4AGbU0QjKoDFpe
 ndRl2/x/wLKVVhhNyxQ+SUqJXfYzQDpHPKJUagbnHGzNXbC64jtgdQUY1AmLBlTubnZ4Lilibw
 PLvoIvb9XPsr7994f/tZnvHBq3yGs6weAGI53fQAAAA==
X-Change-ID: 20261015-k3-tq-dts-based-on-com260-37d5d99a2b9b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=OxI2d1hddR39HnEUvBSLPcjUfPMFYF5rC1EItjvJdoo=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlv7NL+fbBqDL2519m+45ro7mNc92eJHFG15vbge/TTw
 uOj7e2fHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABPRyGf4nxee4L3jxv+EbqtL
 CdM15D5vCDHr4jFNWXpE7q2TKVM/ByPDhTNNRztl9IWMcmoeO0ybXLhK4HXwVZ/f9Zc3eDFeUnr
 FBwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NZiJZo0DdgPmBe4+ovSbMHchOPhQo2baykcy/b6aUc7XCM3OAf3QOjOi
	Ujb/dEzrIXqY/3RLgg3vizIJKUo/dFbB8RgIRSfgN56zB8vbABqFovHaJHGcNykiEs9BnBl
	q3Fm5a578csPuR1Jkr+AtR+0UKb7bCu55zJg0b4BqUtdDtppMw2D6OIpnI0cU/2P+JBnE7D
	lruDcssdBAUg75HC+0Lnu9VZPhWSRYSBZnvCqtQAR4VO64qo2nMjDSnQuv3yraiqNAna8th
	fDLolVhUy97PwovwXXAQyg/6j+LmJfi1g0VundF996KE3QzaXF62iFMGS708ok2ucHa5Rxb
	MLCT4qXCzAy8nIDffjYvle9V1WTRDRSGUwGwRXAuHzEuAcqZ8H69/4Zvhb48YZTdptjIzSJ
	n8XJX24RwBC1qcKYklHIhkZht0nSweqRDScQFrgB+DHmlMNc+v/wMd6agJa6Kz6Tv3PfC8y
	8MrO435kjlQaekS+/wzdTib7uEBLDEfeahD8neUX0+xrvoaiMfkU0eLKwrARJ+42EzrHgR+
	/987K+KBHFUvmyVxnWe9227iIl7VHHx1qHBoqenTuSz17oqqC9iMwRKtyUzYfZRX5OeCs5R
	rXBUqXPzh7l1FZ/eFG6VWyxSKE33ZkRmrnWadVf94EPtzwVqn5pQgF4l4tL5Fa4PxcTXWZB
	VNkCITqres6sPRcMGDaSTKjpGYIooY7v/dxCyDcgOeBVZwrywaxbvDb/bBP1/OE+U8enhTV
	XnPMC/+22PLuJAa7rzXsNy0PPVN4NWjbUdkHvbpjhOqD/VChmOH7S25BmInb3s/qBVBphCf
	SwRNJCZhv9JZx8hWFHFG528GMwZGfljp5/Tb4VOsFz7BpIhnLCbVw/MxfMc4VDvhWWoyhsx
	lWDwijOeV1oXxn33OAAKh+DWdrTJCYSbubgLRuwer4HXqi6GsbSBWPWhZQY+Pz53NsF3YuM
	QXE9bD0sAjqkN/swyf7Nbsac9agj8MCWv2i/2ReoBTgBCFQeSJDQlxGhjBHZ/LYIZbYAM7O
	4oqZ5LtJQ0ls2u+GaKQsUt+scoOqwhSwRzfl12vV4a02Wo7TcJBeRLL88kyk5M7J0eATTpT
	no7heSKXZ+dJBoBQJd5D6MFqjyJFX+SdsUQ0/tzi1HWMKJp9rtqmcNu6iCl7Pz1/EGpTDjT
	qWdQby2b6MtU0DIVmYSoCDf3Ml7wDjktGYQ2
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

This series adds device tree support for the K3 CoM260 IFX TQ board,
which combines the K3 CoM260 module with the IFX TQ carrier.

The board reuses the CoM260 module description for the UART console,
Ethernet, module EEPROM and PMIC, and describes the carrier's Ethernet
PHY LEDs. Unlike the IFX carrier, the IFX TQ carrier has no additional
EEPROM.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      dt-bindings: riscv: spacemit: Add K3 CoM260 IFX TQ
      riscv: dts: spacemit: Add K3 CoM260 IFX TQ support

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k3-com260-ifx-tq.dts  | 44 ++++++++++++++++++++++
 3 files changed, 46 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261015-k3-tq-dts-based-on-com260-37d5d99a2b9b

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

