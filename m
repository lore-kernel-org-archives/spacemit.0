Received: from mail-m81246.netease.com (mail-m81246.netease.com [47.88.81.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A363CF05C
	for <spacemit@lists.linux.dev>; Wed, 13 May 2026 06:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.88.81.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778652085; cv=none; b=Ilmrnq6z+k3Nb2gPzgeBpfruPdrn6PgPrir1Z9LSJC9JL4s8ECsR22oLb/8+EZF29BFXkUrH0OGSgNVV8okANDAh2fRbeiWSaoQHIw2C2Fyinqzh4my/yGtnjm9wk1HlQKwB4p0sF3fAJf0kmrezXqF+elurFwspV1VZ3Fzj+wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778652085; c=relaxed/simple;
	bh=QhNr8jmpw55RK1ebaXOMEGE/6b563n9NFnVQtQvOWZk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fhnrC4Zb2TTYq+f0ZluUnYltO8EKyvSvbz9loiBEDCgmimjCfq88p/vekXyynizhszSGLrzeFPQtguuF+UuPcOq52N8jdTTwYaqTBdzij+zkYjlH3FO1oqxFsC++9kL/qx7Y6+pWfIjWsWHnv3zuHcltG7sLk7k624muPiqiwo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=47.88.81.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e3542995;
	Wed, 13 May 2026 14:01:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: add fixed regulators for OrangePi R2S
Date: Wed, 13 May 2026 14:00:30 +0800
Message-Id: <20260513060030.616473-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511070718-GKC3624147@kernel.org>
References: <20260511070718-GKC3624147@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e1fecbaa003a2kunm76fdac8128a16
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSRpKVk8ZHR1NTUJOTB0YTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pOTE5VSktLVUpCS0tZBg++

Hi,

> please check my comment below, I think this patch has similar issue
>
> https://lore.kernel.org/all/20260511065338-GKA3624147@kernel.org/

I don't think this is an issue. Otherwise, these commits need to be fixed:
https://github.com/torvalds/linux/commit/1df07a40453fd652132051419140950d47941fe9
https://github.com/torvalds/linux/commit/ae9d03f8aec76c1bff21083b67c211238d7c57b1

Let's confirm the current DT preferred:

- regulator-fixed

  nodename: Preferred name is 'regulator-[0-9]v[0-9]'

  gpio/gpios: Preferred 'gpios'
  https://github.com/torvalds/linux/commit/12df2c182ccb850988d2680a422211a812fb5cb2

There is no specification or preference stating that regulators without
software or GPIO control should be removed.

This has been discussed many times, and people are used to describing DT
according to the schematic:
https://lore.kernel.org/all/44ba02e34d7bf6a6657894802a87b690@manjaro.org/

Therefore, if you consider these regulators unacceptable, we should remove
them from other dts in spacemit, or allow such changes.

Thanks,
Chukun
