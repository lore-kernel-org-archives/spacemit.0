Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D693C0A04;
	Thu, 16 Jul 2026 21:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237609; cv=none; b=kPcDaCq8CJH2mnm5Xs4PoYlkyT+2WKU+MseoRwvL7jYgLfpLzmtouPvEL4k/bNGA03Wr1SQA27hEH0uOr4qiiTQdRMVxKo6Wd2Gz2Kfb/H7ZRoZFB547yUMX/Iw1Q87iEi3RFehmQqir1ObJC4St6/bjYVFx9n/4DzA5JUa1220=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237609; c=relaxed/simple;
	bh=Nv+kAOVNf6keFWr3oOhGjkorE3wjzjRtb+df646FHkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HddkcK3gKDiN1NNNOPhPb65ybz6QRpO9czAWJ0ViEvN8KA/6+qZB4Y6GTP6qQoZ05gzso+0Ur8QD70xsygBmNsZHMps4MSjUPE7FmeOzLYCuRHVWbzxxv9C08triyXTEjCr1C5J6LQAsJf+1VbDbnMBVBymcMRprLPHrj8+e4/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=uBwsOZEZ; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="uBwsOZEZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=0HiuZgwH8psQJ3IEbbD0GhfaiOqaajADnn4e7kt49ps=; b=uBwsOZEZW7IJxO8GwedATLuBoD
	w2Bhxbq19q5xeELX8wBqIel3PgLdQLjAwA2bjADbyzn+XeY/ybulnOG9oLgJLYLc1bd/tuAcOaDeT
	vFeJ8Sd4RRfIxX/J01lYxX/+CPEQlCEBtUSkWh+HdCm7Snb5710JB8d3z5OjeYXzocIjoegvnFkcZ
	v4kNdlrB9cqxIiBU6GeG1v1iXTjpV6z8nLLHHdFH2PQfnQ3UbPf8LO4boUWdIqL+VK3uysMtipMZ7
	avF9CqadBTgc5zVm8279V2Fr8CGYoH6y7nWm1M9stI+AKndkRG4RCyzzS57Jy0uqgGmdDKT/SzRSp
	hCxewZBQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wkThs-00000003GYa-1fVF;
	Thu, 16 Jul 2026 23:33:24 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Subject: [PATCH 0/4] Enable Bluetooth and WiFi rfkill on K3 Pico ITX
Date: Thu, 16 Jul 2026 23:19:00 +0200
Message-ID: <20260716213314.3027969-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset enables Bluetooth through USB on the K3 Pico ITX board and adds the
rfkill nodes for Bluetooth and WiFi so that the devices can be activated.

Note that the patch 4 is only useful with the following patch series:
- https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmail.com/
- https://lore.kernel.org/spacemit/20260703021024.495433-1-inochiama@gmail.com/
- https://lore.kernel.org/spacemit/20260709040415.977784-1-inochiama@gmail.com/
- https://lore.kernel.org/spacemit/20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com/

Aurelien Jarno (4):
  riscv: defconfig: enable RFKILL and RFKILL_GPIO
  riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX
    board
  riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX
    board
  riscv: dts: spacemit: k3: add rfkill node for WLAN on Pico-ITX board

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 32 ++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 65 ++++++++++++++++++++
 arch/riscv/configs/defconfig                 |  2 +
 3 files changed, 99 insertions(+)

-- 
2.53.0

