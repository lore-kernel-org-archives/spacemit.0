Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576513;
	b=3UGlEq9Xa0M1kR3TBiuvM+gNRb30tesPz8YP+hn52A1/4nieoYG/uYrA8V2SDBVZtdkR
	 u8kfYbircuiDJKcADgqHf0ZwwOgGzMySEyEZ+bRSTsF9zgRqjNu60lGC8UjNQdweVwNkt
	 k/Ic3x0HecaxLnGLKlCVTH85c3PVhR2hhsxa1OpB3viRPRh4qICz70xDQPfh0LW1+QfVd
	 erRBZljH6XbnKjTzvlCP6BMyxPwbV5n7Z3QzPFMyPDQHSwM7c1icgncLp9g/fb3Zkf9oa
	 TMZPR7O7XQ9AyPJA1jvgTpdVY9b1BuczzDlzFM0G9L3011fVjJHtp4RN+XattAnRa5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zMluFC78cIvBikYbcX1+ABfXuc1qd1361x5Cr08z8xQ=;
	b=NlMK5FBlhrMFFzbtaIousjBjIcF+TUnAZhkws6JIUdLvOGVc8Ii9YhfXWOSm9CLyyTQP
	 AOwo5QQumfdhMfLKeOx3CmACJIto2DM7DqFXSoUzL7xMHTHGZRCiH4xiBYs2ioJ6qTlWO
	 uq7eUoc7l0ZpZKzINzkXsHrZJlqRKXIL+KKAznqEwWFP98RuLG6bjhTO9S8egi3qM183i
	 CPPzUW/2IKOEpsN1LxdQBkU9vkbNl7FFB0icuBSfdeYeJQGosYVX652+f5GfCfSYTWDBU
	 irfYv2OZ0jo0UlzhLXl3y3QylXOLLryzQDI9p3OCdLc104vRFyyLpGrWZ5+6M0RhoCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UZXef6MO;
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E96606E436
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 13:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E96606E436
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UZXef6MO
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4a5f76661b5so3721775e9.0
        for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 05:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576511; x=1795181311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMluFC78cIvBikYbcX1+ABfXuc1qd1361x5Cr08z8xQ=;
        b=UZXef6MOwXPXayDKomo6MIcLTZYUx8XDpFF95NZqGup/uwiCZDtjBDBiKjA3qb9nxu
         1uoDfBTV0YQU40s8DfsGRhm+V6PoMIIg1QgOg2T5GV8GSjblSlmoMXT3UgTREekNYDeX
         g226/yp8jaQrn9b4PnY2GbiEhHYkAauejEuAwuOjaq8ao8eqtsqznsW5XCJ6whT9f0GA
         XZtGZxjVjAJjaYovV9SzijfFL7VjDnhT98RPqLnYNQgFBIr8HV2w+yanfPyxwZFkS43j
         O0rCeYB7YX0w01oLbaHRXCUlacNSvC3JfaM1Qg1D1GD2OXDCHPvefTsuwD645p+iF4i/
         nVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576511; x=1795181311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMluFC78cIvBikYbcX1+ABfXuc1qd1361x5Cr08z8xQ=;
        b=cw+hyuVJzJS4by8nnhl50RNwpxVwLAb98nomrfbG/1l1GX/gj+skf4SJoi+PYGJ8y5
         YPhqvax74FWfov0Y2gTlV7ecFKr5HcLy8b4ek4xIaFU1+ErgiJgz7Hk1uXhXadcA5yfH
         9003YnqRX4R8MIRMFWtGHCRI/ils5QF5THn4ZO6TJdByjQbv8ylfSJqxUDnLnNxGMHk4
         thfESW02qpys6ifv6C50bAYHQVapnpA6QEIuu9tOuiWs5ZoUJ1P+lcVD4csdfocfjI5k
         /vBk7R+y80K69qhcGmoRu68nFShFPyep5vCdQ7vWPlvnvzeQFl02UijYItqM+dJKfO1R
         QDRw==
X-Forwarded-Encrypted: i=1; AL+hErEbcDTgMowWg3SdhyFUI6vKgq2bkloXWPQdv/2leHtiJNl/IfnFfuwhoP5I4ynrClvP3KACQkEoag==@lists.linux.dev
X-Gm-Message-State: APuU4Z+px1tylt7A4Z1mAWXs11Iewyaez6z3TOnz5WD/XiIHAlaLns81
	kMe9HoLc2yiDSFaY8O5E07mooiwOKXePHBHXyKCr5zk+33wzyOw0flDg+FalXijEwDM=
X-Gm-Gg: AYBFou2n3hslbqloSlvWQZBQ6KDCBUkVFd+Wx8m6o4IKOdEE+hVhwcvOORw62q5+RXW
	G9PkrOPbfV8RXVPwmDEbuYA0G82BGg3aWx7QmdKEDC0gCwhgKxdT7YTC8ANXfjapgE/kD02IbB8
	lrwluIo8EmSs7z3sn8InvPdFR8n77cdtmU1GAdApv74T/lgmc4WIJBbwAEgQFyijCv2mfYGB5lb
	8cpnNArw4Jgh7Iu2/BE9GsrzUWuthnS/DSTedsSr/2TXUlyS6pIMCco+5UTj/G6tsCD/UPv2dNG
	ZcLv5q2KXv0PRZC5WCWDQO66JPgrF3wbteAIkJdRvfa6smDUvklnj3f4D0QxACx0iaiwSG4C8h/
	atFDmcqFZc81bM2K+jK/FsEE1KGy+Bas7f6Yds5N0gxBXpUbRnZcx469GcvtcOiXaNBAiBaR9Yj
	iO+dJGsWbg15ocxjkm4gDXZ406XNFJprOPaH4DLHcC4AF/k3z3+Ad8eRtWKNe4PAGph0FkQxtie
	VcpbeYVbeQZXa6ZnZYQB2YEj09Vpc/8hDKx76CUBhWXKytzVfE7m1OmPI8yOcimhnjt/5Aw6cEj
	AopGgpWPNH5AvjpfgQ==
X-Received: by 2002:a05:600c:8905:b0:4ba:4395:5755 with SMTP id 5b1f17b1804b1-4bb55a6a5fbmr35028905e9.5.1794576510932;
        Fri, 13 Nov 2026 05:28:30 -0800 (PST)
Received: from workstation.. ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm4802673f8f.27.2026.11.13.05.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:28:29 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Ali Tariq <alitariq45892@gmail.com>,
	Tomas Hlavacek <tmshlvck@gmail.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	leitao@debian.org
Subject: [PATCH net v2 0/2] net: spacemit: Fix TX timeout work deadlock and RTNL in PM callbacks
Date: Fri, 13 Nov 2026 18:24:33 +0500
Message-Id: <20261113132435.434615-1-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two locking problems in the SpacemiT K1 Ethernet
driver.

Patch 1 fixes the TX timeout work, which ends up waiting for itself
through cancel_work_sync() in emac_down(), so every TX timeout leaves
RTNL held forever.

Patch 2 takes RTNL in emac_suspend() and emac_resume(), which fixes the
"suspicious RCU usage" warning from phy_disconnect() on suspend. It
depends on patch 1: suspend disables the TX timeout work before taking
RTNL, so it never waits for the work while holding the lock.

Tested on Orange Pi RV2 (SpacemiT K1) with a lockdep kernel: 12
suspend/resume cycles without the warning. The board loses its network
after about a dozen cycles with or without this series; that is a
separate issue.

Changes in v2:
- New patch 1 to fix the TX timeout work deadlock (reported by Troy,
  approach suggested by Vivian)
- Patch 2: take RTNL before the netif_running() checks
- Patch 2: drop Breno's Reviewed-by, since the patch changed

v1: https://lore.kernel.org/netdev/20261105123441.2524171-1-alitariq45892@gmail.com/

Ali Tariq (2):
  net: spacemit: Fix TX timeout work deadlocking on itself
  net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()

 drivers/net/ethernet/spacemit/k1_emac.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

-- 
2.34.1

