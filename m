Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095763;
	b=Yz1kHN3Voau2JocNQEELzIeeaWphL/EcPWwZHjZmSiBZId3uiuCSFxxT+/V6qfAQ+X7d
	 KH6VE8R5+XfhoaFP9zdYArsyNr2alKQ0qro6rSmuH2RCzycsLy0HZbopGYU2YxcdeAkcH
	 dBtkJotL6WdpAU63zOzDG1iQX/mIxdKGY4QjJfABA6TVIMLkurqNOFhyV+U2BkJOnHrTx
	 hZjpG0JOc93M5kdxhbn/YzLqqGjeV6WaerL8IHPHXM6qDX0JujgblL/yTjL/T6s3Ks+h4
	 qcvqBeLUtiybtS1o44UjF102NanrLtcB3cUod90Zy+mV2/9ROddXd1Gf+WCbhZ9MEQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095763;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=93JGExmDvLbuW+oC4tjK7kMLorNu6gupm5sqCUxSJas=;
	b=FYFba6kajdmhkPDX2SbTesYT72HZRtDTK6USegw0UAYxMCnDNF6pC1aHngCKOR3UBL1G
	 nPYg3ib8LGAzXT6+EFEctQdjqOoomYi87QZ4QPCuz+Ib0dAZUVnJfmA8O9CI+UHphhlkR
	 zB8iu5i4WPXAFNMnPkI9/zqXKcwKRQCsnezRbrxK891lMaDfd/wPxb+4DwT8s6l84FC+T
	 GIMfDNzK+uAsemBpeoYvaPpcAMYLg3d1M/xWtUMrpM1PhQCoJJ/pjiv3XDESs7VDUalz0
	 p9pvlOPkWaes4W5iz3xK75gRVcmTYTVTnXsgLuTkQJ1Qa27/K9lFBdJe1qb0DIvSR3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=eqBwHURk;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B8F606A324
	for <spacemit@lists.linux.dev>; Thu, 19 Nov 2026 13:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B8F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=eqBwHURk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795095719;
	bh=93JGExmDvLbuW+oC4tjK7kMLorNu6gupm5sqCUxSJas=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=eqBwHURk2PLsyAbagUCMxOdlkzSbEEX0M+oeSbD65A+DlWwW+Dy2OQdloTxgs0MQD
	 uykMp4MOehMzftouapqui07rj9CYKJn7IpBdh5/9f/bCcfOWE1M8DyGUSMBdEK1nYg
	 ONtQWQlyqn0eVLX/+9nNUHFHnp1Gt3SFTQ9/IkKQ=
X-QQ-mid: zesmtpgz7t1795095712tffd6494b
X-QQ-Originating-IP: dLUPNlyNIbcztw6i3WSgaEvFS/vMwOSwntm0pZqPxsU=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 21:41:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17830256423621997771
EX-QQ-RecipientCnt: 16
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: [PATCH v6 0/5] Add SpacemiT K1 USB2.0 controllers support
Date: Thu, 19 Nov 2026 21:41:49 +0800
Message-Id: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
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
X-B4-Tracking: v=1; b=H4sIAJ38/moC/33OwU7DMAwG4FeZciaT4yRtzIn3QBzSxGERrJ2ar
 Rqa+u6kk2AcWo6/ZX/+b6LwmLmI591NjDzlkoe+huZpJ8LB9+8sc6xZIGADTqHsjCwnH/iYz/J
 DyUvpUFLrYwrodLRO1MvTyClf7+rrW82HXM7D+HV/Mqll+r83KQkyoQsJiS1i9/KZ+8t1/7O4D
 8NRLPCED4zArWO4YNBqgyl5sGoT038wbNcxXbHALZB11ICmTcz8YgqA1jFTMYzk2Go0kfwmZh+
 YUhvNbMUsBu2QQvDNerN5nr8Bt1ZucPMBAAA=
X-Change-ID: 20260812-b4-spacemit-k1-usb2-97adfc283d58
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, spacemit@lists.linux.dev, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795095710; l=3014;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=TqluRmT/VQB7LfSLhpDGI5y1zKrDzvzJhnZexVT50xs=;
 b=bdUeE/ceXJs7e8o00nWPNNac+fn8nBAqapatdHquoFv7z/unRMxfetBfGUn5zNQEV2ylmXgvy
 TyMtGcpo1ROC+cAW/rdSS0DP90HgdbTlk+vM+m8Td9IiLVmDfC8lHaW
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: N2HpPvKmKSGYe8zJYY7MYBnA6TyWeNCu3c8U+3vJVWIdaql9odzjwRAZ
	YbvJPsOhRCvqNg/NsjDY+29kM56t/LoVZaN7vPRzIZL5zr8hl6+V8Rj0iUVW/rzVLly8lBL
	3/PBGCO27BF6HVh4lphBPjASHpgqp45kW4duVDLbZ6eaDQ2rUw6TfEtwbVFN0EOIdSFml/2
	8qJd/lzOQLnbajbIgiNt4wnSi+w21nxB+RZhzvaUyvmXUBCWl8gRLWKAl6L1NggbOZ9aacP
	m6N1B7Ht93HXn0NjCSnEGOlZI9S7NwAZUlF0bwZ6wr4Q46ypDleFYrAyNCxnNq2PhaWFH2D
	1/izRm45YbSUwPStK5sMJBEbKERTjpP2A3rXpDoP3iTdkED5kXJT4jkwPCVeQrCGUDEkcz0
	7SPeOF5pBg/3/d5fkQjw95qz8hChYs6+3+pByXGe3wDaHCdzwj1+zKJFfr1o7b0zHHORYDf
	GQcK5Un8MOdBENtzrIwvN47GiwojB0QDTCU263Jjotem9v0RU77Jbr1LyW+cAwU0VBdKThU
	lKukNcIuuoGeIJwnE+1ZbsK0oGFs5Nadr27pNldIOr8kmHOVColBGR+nVy5rgmdwwQ1uLMw
	cZ9ytjbxB1lgsldNcmbX32d478ZZn+JT7bVhLC2oM8MAl57gg2T6iKhAnRUqz0FGGERcW+m
	jkAhatxqmkGqylKo+bPnTEXgQEiLJzOzDdcPQ/DcLl97MTTfvBWrx9RINl61iXuzlcep/pF
	VFdbD9Nhc3ql/9JyLlUzXcANQ5GqTTupJ3fD9NkCVqjrzXoNIAnMKbFjAIG9FFgephploy9
	f2Iu6DEDqpewHvS6f7JOE/dQCc+XUtokiCECDwR0yqqHCrasEY7eftQO7rfel+RepoZ3ICw
	S+gtTbc9sy+fU25EMybIc4N7JslDM7BqjOUhIaglo+E6ADTnWLHhaLFI6VqkF9haK5Om/Kb
	/jofkoH27lFOtUxiwiUTBIjJcjiZYvZ+9br27i+Of+s3281oLnt9rJUtwP81lRgWYLB6gnS
	4JpUxJwg4Grv/49FVw5kHcwHolekdQl4/4bHLm0ToCieV7B1EE2wVUz8Q7EWq/bSJyj60NM
	czVfqSi3j8xYlXEpGWvKYU=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
support, but the hardware has no internal OTG registers, the other is
Host only. These controllers are compatible with Chipidea USB2 driver
with some flags set and reset control support.

This series is based on 7.4-rc3 and has been tested on Banana Pi F3
development board.

The devicetree and defconfig patches for this controller were previously
part of this series. They are now sent separately against the SoC tree,
so this series only contains the binding and the driver.

A self-powered USB device/hub is needed to test the host function of the
dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
cellular module e.g.) is needed to test the host only controller.

---
Changes in v6:
- split the devicetree and defconfig patches out into separate series
- rebase on 7.4-rc3 to pick up the devm_kmalloc_obj() treewide, which avoids
  a conflict in ci_hdrc_usb2.c
- Link to v5: https://lore.kernel.org/r/20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com

Changes in v5:
- rebase on 7.4-rc1
- drop the ci_hdrc_usb2_priv struct as sashiko suggested
- Link to v4: https://lore.kernel.org/r/20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com

Changes in v4:
- drop irrelevant Tested-by tags collected by b4
- collect Reviewd-by from Yixun
- Link to v3: https://lore.kernel.org/r/20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com

Changes in v3:
- collect tags
- merge the two dt-binding commits
- use local variables when acquiring devm managed clock/reset
- drop manual clk_disable_unprepare() from the remove path
- enable related drivers as modules in defconfig
- Link to v2: https://lore.kernel.org/r/20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com

Changes in v2:
- rebase on 7.3-rc1 and collect tags
- reorder the usbphy and usb nodes in k1-bananapi-f3
- add constraint for spacemit,k1-usb2 in dt-binding
- add OrangePi RV2 device-tree change
- use devm_clk_get_optional_enabled() for driver according to sashiko's advice
- Link to v1: https://lore.kernel.org/r/20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

---
Junzhong Pan (5):
      dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
      usb: chipidea: usb2: use devm_clk_get_optional_enabled()
      usb: chipidea: usb2: drop the ci_hdrc_usb2_priv wrapper struct
      usb: chipidea: usb2: add optional reset support
      usb: chipidea: usb2: add SpacemiT K1 support

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 15 ++++++
 drivers/usb/chipidea/ci_hdrc_usb2.c                | 59 ++++++++++------------
 2 files changed, 43 insertions(+), 31 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58

Best regards,
-- 
Junzhong Pan <panjunzhong@linux.spacemit.com>

