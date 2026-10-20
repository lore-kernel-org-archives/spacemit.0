Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484264;
	b=XxheAJHzMpn4NTo6nJN0b/3r8omJ7YZtuxvfEdD4xJj0bIrZvDfmqe8txsQJhm1Z+ngY
	 s5KqW2IyY+PwCH7seL+/c6xYdq/0L6kEI5ZEqt72X6xGf6KXx4zK0/G1JID1QhC1LhD9M
	 LjZ8L6nymNyHgbrug1beBPgYq36zk2frXBrCCLSnwoPAL+HUiJzJ3n0Y/za9GK3EbgxHa
	 Hq3WextWUOOqpgN1OYZh5g9JqcMK1rOAwbFkZwI2z8IqPkPjlvKITsxiWvHTepPJXMJ1W
	 zflAI2Fh1VOoP362GT8D2wxG6MD7rhykQy4UtgjzDg57DbR0J+1Ek0On+9p1lwfKKAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484264;
	h=DMARC-Filter:DKIM-Signature:Subject:Mime-Version:X-Mailer:
	 X-Original-From:Cc:Date:X-Lms-Return-Path:Content-Transfer-Encoding:
	 Received:To:Message-Id:Content-Type:From;
	bh=cDtDx7PTZzs4o4nilnbUUjmgVNV0A2BPpv//8jccmfM=;
	b=QbNsFxDmr90WYOCP+YAMV7UPuMXFDWro8+vwGJAUQjrva879zzWjxLbN6PnRgdvP99EP
	 aOlHQ6YckP1LzWCvdro5ftaQ57vXQHK5kZS4vEDvMuq4KjhKkxT5AujQMhMvPs/THUP5P
	 4LDRU3t3Kox6xCq4rk8jqm2nOYJiwFrCja/hmA5nck9y/fZiXi5pnlBRQB0GryS4q3m3C
	 GqL5IHPR2RC37yVrxOD700YWQg4tQGK8dFGZB7WkBNCoJic6uDhOuc9N1KfSyAPGhJL51
	 V9JLG0W6ZxrFHt4nyUhdsyNKO5BeUfNdzZig908g8z85TVnlwIiRjxcc+NgLBe5Oj+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=F6uNkYsz;
	arc=none smtp.remote-ip=209.127.231.29
Received: from va-2-29.ptr.blmpb.com (va-2-29.ptr.blmpb.com [209.127.231.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D6F606A31D
	for <spacemit@lists.linux.dev>; Tue, 20 Oct 2026 08:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D6F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=F6uNkYsz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1792484250;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=cDtDx7PTZzs4o4nilnbUUjmgVNV0A2BPpv//8jccmfM=;
 b=F6uNkYsz4tTHLrAVSbYwUXuAoBED5I/H/sbLFaqCFUEmMublUSJ0b3bkkM+gPkEpXB8Qhs
 PjEb7c1t/6m6TmgbNhdTcTNWN6h1CRuS7DrhNWPH7sVlTeaI6LvUz2jBDj+5FuMdbUZYkD
 Mbn7F/uU8GIY8c95ROIQq/gBAHyviJw8oe8ANUNS0MTVWcW1+ZDcD9yRLcQavJzz47Ucq2
 XE0Om06kJ4jMxdeTSt5lIxLg4aq9ELIv3gTcCJgHUS6iXDnmUT6O7Vf8zPwPZq5HHIgqid
 Nr4re2aq8Kl01ioKI/v1rvsQ3vXriNi15OA4U47uSeowMAtxRtqpbrdR9aU0Ug==
Subject: [PATCH v2 0/3] Enable USB and SD for Deepcomputing FML13V05 board
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 20 Oct 2026 16:16:33 +0800
X-Lms-Return-Path: <lba+26ad72399+fc4508+lists.linux.dev+sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([14.155.180.235]) by smtp.feishu.cn with ESMTPS; Tue, 20 Oct 2026 16:17:28 +0800
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Message-Id: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
From: "Sandie Cao" <sandie.cao@deepcomputing.io>

This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC 
regulator tree, add USB controller and USB phy, Enable SD card.

This series is based on next-20261016.

---
Changes in v2:
- Remove usb3b, usb3c node define in k3.dtsi, it's already uploaded by 
other patch.
- Add phys and phys-name define for usb3b, usb3c, usb3d in 
k3-deepcomputing-fml13v05.
- Remove cd-gpios, use non-removable for sdhci0. 
- Remove vmmc-supply for sdhci0.
- Link to v1: https://lore.kernel.org/all/20260922110231.3426011-1-
sandie.cao@deepcomputing.io/

---

Sandie Cao (3):
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator
    tree
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller
    and USB phy support
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card
    support

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 223 ++++++++++++++++++
 1 file changed, 223 insertions(+)


base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.43.0
