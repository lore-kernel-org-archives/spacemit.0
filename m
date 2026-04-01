Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701263AEF5C;
	Wed,  1 Apr 2026 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062555; cv=none; b=TNXh4DjDn3vqgA8QgW1AlDYXitT+gE6srqzLcn0La1N/Qt2xbQcR+LcB/+gKIqsCc7RwWuog95PNSkE9UZ5wZlQlFf8iw1VIrD1/fqpNP68Qq0x2uEz2dJZYIoM6Qasl/wf0ZERoiC9Hc/NN2VUWvmqOwX4yy+7PtdE8vGOtyf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062555; c=relaxed/simple;
	bh=nCxpgYTgCnLZXthaW85uj8NL9DCQ+cCj8piX+9Rw2rM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IMEQVUE9AFnJxY+hebOlUd8x1x4iqEtkDv6dzF9P6w4CuDWBlDab+YWOgiauKDf8di+T5AJXtA5mGr6NYRCq72XwsZJXF5OYtb+oV5RIUR7UU6PKGRW5V0yeFMod4iMGvRJiXWv5AfSIKVHGFy1D81hYweZe75wHLWgWwIHrlXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=DxwemFI+; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="DxwemFI+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=hkQuXIrDKyFIn1XxIaEC4SEoSONkzaq7cF9jpCjwrts=; b=DxwemFI+6+QOSlBXrjoK+lgyZT
	SYaFgZbO4scYryeCjgg8bkCy1/MxXNqY6M0aA1mhoI5+FbQd1qF6Eelu30CnhKKF6d+5fDwJksArR
	wxQ3ns7q/c9UsA9a8ZaLh/Am4qsGB8uZN7dEcO7dPRjcHRdfgXzK/P5XuQlUoTVYBi2BPu7Kxm9kC
	1tji59VHdcf6pPiEBLl7OTAVg7AXsBCe+PGSTtSXPWULH0PbA0clgrTkas2jWhzHIOvPDjjgtCh8a
	edeRcpOtIJlEmAhtKt3Kb1c9IUoZVMIPD5deZB/v37qnZeGVGO06xiahqL7wIxwtweEx7YB6ALoRx
	Do0AWKdQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w7yr7-00000006UOZ-2ULC;
	Wed, 01 Apr 2026 18:55:49 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Cc: Aurelien Jarno <aurelien@aurel32.net>
Subject: [RESEND][PATCH v5] mfd: simple-mfd-i2c: add a reboot cell for the SpacemiT P1 chip
Date: Wed,  1 Apr 2026 18:50:37 +0200
Message-ID: <20260401165437.1048786-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 drivers/mfd/simple-mfd-i2c.c | 1 +
 1 file changed, 1 insertion(+)

Note that the spacemit-p1-reboot driver requires PIO support in the
spacemit i2C driver [1]. This hasn't been merged despite being ready for
weeks.

That said it's not a hard dependency, in most cases reboot will just
work, which is an improvement over no reboot driver. The PIO supports
just makes the reboot driver reliable.

[1] https://lore.kernel.org/lkml/20260207-b4-k3-i2c-pio-v7-2-626942d94d91@linux.spacemit.com/

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 7315fad618e44..52c81b18750e1 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -105,6 +105,7 @@ static const struct regmap_config spacemit_p1_regmap_config = {
 };
 
 static const struct mfd_cell spacemit_p1_cells[] = {
+	{ .name = "spacemit-p1-reboot", },
 	{ .name = "spacemit-p1-regulator", },
 	{ .name = "spacemit-p1-rtc", },
 };
-- 
2.51.0

