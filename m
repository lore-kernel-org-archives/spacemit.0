Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4298339DBD4;
	Wed, 29 Jul 2026 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785337658; cv=none; b=HNzrrUmGs/DeV+qgKjTtMtovNMPaZ8bqKYm54M+oTsF2fKn+WDQOBo99VBtDCV4xWO3apj/dOvSAd9G15eZBEYDNZpoRWB0I64E6sWo4uz/TBapOJZ3VqP83lDbjwNd4nlueTevfS9eY5xjN4C8t8kurWHH5U+xD1DHAlzrJGZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785337658; c=relaxed/simple;
	bh=vSxmc2FQ+ZDk2hGWIiO/I83y4ahlPnFK/ITcev6CrtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CeLMNK2FpwcQCAYK+v9xspIEsiZgV5V1iNvvswvfQwLIJbrv9790G8tJKa8AtxuI56P6Vp/gknZnPF07jVaeQfE/mKmkWx7+AmIc6vhSRvwOQzjJR9Oq1phY4H4hF3lV3vofdm9TKd+GWTU3CE8EEtkjfIYyfuNvEbUEP/EEZsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=YigJJK8k; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="YigJJK8k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=3nno4RIjepssL0babb4nLq1//aOFhCPGzoSYoFo6RvQ=; b=YigJJK8klIBdzXr3gct0pCuRdf
	o//2LSjGN4pKSSG/Dc2j89NT9+8vJZXl8Gh2MXkqEW9GlRU53xFidPpkiL+1ZxzVMYdTk8GIGFP71
	wgE7RwUD3qyc3AdCS35e4i2tUcELo080dueJuB8iq19F+kFfl15EL3jqX6eUBAXPza5cmv4vUZGwH
	CgzolIzJlGQv8lu/nXF7jEGc/mZFkqEtrhG5nJkWmipGsZPG+3iGsRCFj2dWiBI7wb+M7tA2RloKR
	cjC4uzbAe7RFBwmdlu4Nv0+sJpJRCcFvpbsoyicnXvv2R/+jewW40zY7D+7VJD+snlhLTUjr79RYp
	7YGDntYQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp5sa-00000002eB1-1FM9;
	Wed, 29 Jul 2026 17:07:32 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Subject: [PATCH 0/6] riscv: dts: spacemit: fix maximum CPU core voltage for K1 boards
Date: Wed, 29 Jul 2026 17:02:17 +0200
Message-ID: <20260729150722.1598630-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT K1 based boards use the SpacemiT P1 PMIC. The buck1 and
buck2 voltage regulators supply the CPU core voltage. They are
configured with a maximum output voltage of 3.45V, while the highest
operating point requires only 1.050V. This means that a kernel bug, OPP
misconfiguration, or privileged userspace could request a voltage above
the safe operating limit, causing possible permanent CPU damage.

This patch series set the maximum regulator voltage to 1.050V instead.
There is one patch per board in order to ease backporting to older
kernel versions.

Aurelien Jarno (6):
  riscv: dts: spacemit: k1-bananapi-f3: fix maximum CPU core voltage
  riscv: dts: spacemit: k1-milkv-jupiter: fix maximum CPU core voltage
  riscv: dts: spacemit: k1-orangepi-rv2: fix maximum CPU core voltage
  riscv: dts: spacemit: k1-musepi-pro: fix maximum CPU core voltage
  riscv: dts: spacemit: k1-orangepi-r2s: fix maximum CPU core voltage
  riscv: dts: spacemit: k1-bananapi-cm6: fix maximum CPU core voltage

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 4 ++--
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++--
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++--
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 4 ++--
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 4 ++--
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.53.0

