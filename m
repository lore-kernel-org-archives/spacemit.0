Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967808;
	b=seXh+odRh2bVmSX1VqP2ape//Bai8WiFrJ0OnnWdQh4GyCPq16RoPvxyeUYwBBhPWVVN
	 82PZe4HxZrf7BxpHJv0n7tXdfza6rXAB/TNbt/I15MKf9fm0sd8tRhDY0eRdmGxtuja4w
	 r3gYlON0goZgtFTr6sl4fsCME+B6PvZhz4pbGJNS9H82nm6bPIer0oTVd2KgPTMdQhgPQ
	 NZcyLXaU3+ivf5vWqVUCmgNAYNW7fb2Fzet/V1nkwBU/SLct9W8AI8mfRW8LCtcjgBDaB
	 K7K21w59910kXWXCFWbKMeO0WPCFq3TY9ZBeIaCpK+qQYhpq/9FeaNTAV1B6KIhiBjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967808;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=3PpxRRk/bQeKzZGNJ7h5uX8M1JkfHN+OI1kHnZjXcQc=;
	b=dZpJzaN4e88za2vGryoME8X4SlN93DZ5RzlMCyDa22VXygM9HEWRP5SsMZ+9g+AYKRSC
	 tFgPBaRRF6brqYkyZ9PnHuPzBOp5A6I8Pq7Hxl72nI24akit8F9hTdp5KgWby2DgkkX3Z
	 VB8FBe0BWWsJmbv3b9boDWG7aiDJR2JoEpsEAn9eia7WTwEZZ+vLTJwZlWcXo+5p5lIv0
	 w7Tne0bLaVuPvxBI+xC8gO8spMQBn9/tN+m5R6ez9VuwIzXcqo/D9d0JQE3GUu9xqVrHn
	 xqEbPjAOLEc2AFZE9p9AdV0XgS+bVYNAJM3Uait2p7yW5THWlpFRe5XqiPCy2S1G3+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z3sJ6LyQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6069606A31C;
	Wed, 18 Nov 2026 02:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z3sJ6LyQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8061F000C4;
	Wed, 18 Nov 2026 02:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794967807;
	bh=3PpxRRk/bQeKzZGNJ7h5uX8M1JkfHN+OI1kHnZjXcQc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Z3sJ6LyQMKVy1d/xef/3MwiMpiSrXumXLqU4MT9bP96vl40TiMb+I5PPGlr/6IgBg
	 kF2Kb5qyk4xxv99ndlXrB2A80HY/YnqqrMxHkEMXQz9FiMUy67oy4o+WVRjQVCeNXf
	 SlGLm/qMweA8komZfsKUJ8xZ0xLPJJFCZRtIt1QBZzKHFm4Nt06kYdYqrsBehNhcA7
	 cFlM/Ev2Cxdwjufc8uI8lUNe8/2pm5O/SKC1JM3camj6F9x6+L8yBubkpB1uEUUlVW
	 9emalSLuo/6UbiVb8MBz8lFfmnVPdKfNPEU4hKB96PEhfWA8n9CzKaTvI8XT2XMBKz
	 TTf8fyuxS70xQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A664392B1FF;
	Wed, 18 Nov 2026 02:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [PATCH net v2 0/2] net: spacemit: Fix TX timeout work deadlock
 and
 RTNL in PM callbacks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179496780578.1408948.14862363785692324970.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 02:10:05 +0000
References: <20261113132435.434615-1-alitariq45892@gmail.com>
In-Reply-To: <20261113132435.434615-1-alitariq45892@gmail.com>
To: Ali Tariq <alitariq45892@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, dlan@kernel.org,
 troy.mitchell@linux.spacemit.com, wangruikang@iscas.ac.cn,
 amadeus@jmu.edu.cn, tmshlvck@gmail.com, meatuni001@gmail.com,
 s-vadapalli@ti.com, maxime.chevallier@bootlin.com, vadim.fedorenko@linux.dev,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, leitao@debian.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 18:24:33 +0500 you wrote:
> This series fixes two locking problems in the SpacemiT K1 Ethernet
> driver.
> 
> Patch 1 fixes the TX timeout work, which ends up waiting for itself
> through cancel_work_sync() in emac_down(), so every TX timeout leaves
> RTNL held forever.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: spacemit: Fix TX timeout work deadlocking on itself
    https://git.kernel.org/netdev/net/c/0dcf21648f25
  - [net,v2,2/2] net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()
    https://git.kernel.org/netdev/net/c/f60eae61466c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


