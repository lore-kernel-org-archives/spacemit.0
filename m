Received: from skyblue.cherry.relay.mailchannels.net (skyblue.cherry.relay.mailchannels.net [23.83.223.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DF232B9B1
	for <spacemit@lists.linux.dev>; Mon, 15 Dec 2025 10:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765793425; cv=pass; b=qYxBKJqN8+4IyB6w3GN/nQnj7IAyWnUTSYLblC2LbQnh8ZDJuZPw2+6JniKFglYKEhzVg99HpdsF7OBhatmsItlzdoO0GLHBZdSTg2gwSM9NsTxb6YiaXPouG0CsDY7D8nOHU4m6TpR10eQHxF/QvWKEJUNKy/NDiZKPk3sPYQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765793425; c=relaxed/simple;
	bh=wSvt6iYy5PKYCcjBmb20QmnlRuOBNlSq1bdTiC/O5QE=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=B6a1gDwoMKcCK3OxW0I2qQvQiuFvQUgHLi6F7opfbA1NCuzWvqlbhCdDyia3vwH8Q55x51T+YR2IDjGwYm+xYHhYsJ5pkZHLv8/B7VBjwOh/SxBUUoy3F+IuV3qWZxqNpgPVBPsQ4FBWFjwnCqiJdOUY+0hK/71wkKLjCqkOQeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=l6lWVKD5; arc=pass smtp.client-ip=23.83.223.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="l6lWVKD5"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 35FA08C1A5B;
	Mon, 15 Dec 2025 10:10:17 +0000 (UTC)
Received: from fr-int-smtpout21.hostinger.io (trex-green-6.trex.outbound.svc.cluster.local [100.103.181.229])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8C6F68C18B2;
	Mon, 15 Dec 2025 10:10:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765793416;
	b=5q0e4ZQoqC9eR0hIb06oLPXZd3topRzp+c2WM5TT+6eFP33U0R7b1CDBRi1rEF8YZ4FWhk
	5C662hQnMJ+4GB5YuRCQifqtxQw2bPealhP9OGgtoIZ3vftPnRqa6VcyVaA+eOxuhBu60q
	pfFSgb0+1ErxG9mjbZJOZSPr6sP2qxe/lPBFcl3z6VctxT1j9T/ob5PaoCIcTH+di5R49M
	4QkVjaieXrAgR7lQVtGcY5uTMhKUvmucHFOEuD27a71O4dw+1z1DqJnKIyIkGZuFvabdkX
	MK7G1r5o0CpkMcdgKhmyk/cUHHf8QQQ7BoUHxuO8TzqZmLRAmbMapPBqze2nkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765793416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=MdrmeeCks4FJzkBoGakJbsA/aHmeUE8JtLcDNU3joKA=;
	b=iNFHZha9EUz9IfCJoby0ESjnijLbxE0GuE+npkUAJqI59oavuoqdxI8W0tIRtnCJBqbYOu
	6apg7eQqyS5P5bDXX9kwhqdqtmy1/keS4n6i2jPZPfaQdrVLDn+3q2B8ZG3QyNQRlKOtwb
	87BSR3uVw2/E/o6HUAIweW1j24tpiyXWHX8gS/2sKj5H8EAMw5I1pc/v3HlXqlbDtuCoAA
	CzvaqYpVYuasVfpAQ9g4dFVXHZuL+uBDtsZ2j90wObqXfE94O1h3TC6CjPcpfdx997vhWC
	DMbSr8FO+sCHVJxZT/JOWFmYENWDHu8DpweoJ34oPcZCt3cVZPRE54R9mNvY3g==
ARC-Authentication-Results: i=1;
	rspamd-659888d77d-l96jv;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Language-Tasty: 650e12c43d4a52d0_1765793416966_771428107
X-MC-Loop-Signature: 1765793416966:1917266722
X-MC-Ingress-Time: 1765793416965
Received: from fr-int-smtpout21.hostinger.io (fr-int-smtpout21.hostinger.io
 [148.222.54.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.181.229 (trex/7.1.3);
	Mon, 15 Dec 2025 10:10:16 +0000
Received: from [127.0.1.1] (unknown [IPv6:2001:861:4450:d360:b35b:2e1:df94:f057])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dVG5d3m5Sz1xmR;
	Mon, 15 Dec 2025 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765793413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MdrmeeCks4FJzkBoGakJbsA/aHmeUE8JtLcDNU3joKA=;
	b=l6lWVKD5824ZhPJyg7AJVVYAY/RUEm1EcL4vDKczxhCGFUzB8coFomAy0ZdIrS4AlQVwEK
	GxpN/7lSax3HXvh0uIqlwnEzVXI+CYf4aXeZ92YEhPRp3OAu+2kdAyqaZ2kelVyYJwTuZ8
	f+bw96UMjuVfLrvZEAA2/8AFlMp+rZ/ZmbThvG7v8YC1L7Xl1HlF3IvweviKG/LRva6Vun
	A/Fvj+iwWDoAtqcoJpWpaDp6s/+QamepQLwShP13sILM/u5AEuw+seFYAWoKT5qp6K+F7H
	1kBPmjQy7P4lEKeM9r9bzUAXyn+sk0tYYU7LJWhzKX3LgTc3qQzvMP9KdKcevA==
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 0/2] Attempt to enable MMC on SpacemiT K1 boards
Message-Id: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHveP2kC/x3MSQqAMAxA0atI1gZstDhcRVzUJmoQB1oQQby7x
 eVb/P9AlKASocseCHJp1GNPMHkGfnH7LKicDFSQNWQsrgbHwwWO6Jhx2zw2VelrbsU2RJC6M8i
 k9//sh/f9AB3ORZBjAAAA
To: Yixun Lan <dlan@gentoo.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
X-Mailer: b4 0.13.0
Date: Mon, 15 Dec 2025 10:10:13 +0000 (UTC)
X-CM-Envelope: MS4xfMZ5MhDyPJZPwYDKvirvxx1fKMrm8UoTCMi346wdL8uRWeA3Al2RY9G2cF9BkrsAAhUKdjkzOcu56gqcUxPOhHdVbMdgKCPgYcKwR94+3OpGxDbFYnhI jlv5sYzTE0rGv3jrrsdONE2XgoSUuQbQxtMu+5Rufk0d8RKnZhwXVJ9t9vOhnfFoD3ZdinBEyGyp/vRR2wq0sMw+5brES4H87+geK+iDWfcJ8barGw5g4f+P ZAgFJl4LSRF9/+X9onU9edsjP4fC5Mpq8R7/vSJGEPF3XszMFBBknYoCpFXmbwlaRyuo6JCeldW6f7xh006Podgvonl6mKxCQbNISYe9XRYxOaf9E9P3AyjX Zreb7dbvBcwZjB3D3EENEfiQQqkW1xm0FkwvchC7EfK0rBjKMTQFI9M7iIJ5HltL38KrEUNkclfyfDMTB3/JKjOrTyTDl1c+0K6G986z+AuzAtOj3bE=
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=693fde85 a=1de+KQ0ukeRx8XkBeA/5cw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=wSgA-RrWGlcEN9QXZX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com

The following commits are trying to enable MMC support on the OrangePi RV2
and BananaPi F3 boards.

This is partially supported. On both boards, partitions are
recognized and a filesystem can be read until a certain point.

However, after attempting to read a partition via dd to /dev/null,
this error is shown:

[ 503.868650] Disabling IRQ #21

IRQ #21 was indeed the IRQ for mmc (from /proc/interrupts):

     CPU0 CPU1 CPU2 CPU3 CPU4 CPU5 CPU6 CPU7
 21: 390 0 0 0 0 0 0 0 SiFive PLIC 99 Edge mmc1

This "Disabling IRQ" message comes from kernel/irq/spurious.c,
meaning that the IRQ was spurious, i.e. not handled by the driver.

This is confirmed by the number of interrupts:

     CPU0 CPU1 CPU2 CPU3 CPU4 CPU5 CPU6 CPU7
 21: 100391 0 0 0 0 0 0 0 SiFive PLIC 99 Edge mmc1

What could be wrong? Are the pin configurations correct?
My understanding of MMC/SD and of the K1 SoC is very limited.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
Michael Opdenacker (2):
      riscv: dts: spacemit: Add i2c buses on OrangePi RV2
      riscv: dts: spacemit: Add MMC support on BPI-F3 and OrangePi RV2

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts  |  12 ++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 176 +++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     |  13 ++
 arch/riscv/boot/dts/spacemit/k1.dtsi             |  10 ++
 4 files changed, 211 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251215-k1-boards-add-mmc-843c7d9e5822

Best regards,
-- 
Michael Opdenacker <michael.opdenacker@rootcommit.com>

