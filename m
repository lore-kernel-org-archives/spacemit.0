Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346AA2836E;
	Sun,  2 Aug 2026 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785637217; cv=none; b=ZejCnSH9BZ5QaloppceXKHj1O1ZxXEIKsoLLeO7UIDo6vXKA6ESPZN/tUiL4G+6OxX3R9B6V1FMrgqb0hp3+LrbH9+G2KEizs9bFWiqIkdRI5P+0NHPVDCDuzMYt3xgnT/hF8TKaj4rHvs4P8ICCh35TlHahQ91SM0GDF9ypUNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785637217; c=relaxed/simple;
	bh=Pc6ijemjw9JEpCJLWcf8vgM/2djgyNzTuRFuDEi5Lxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QxRCkFDOPM1oHbNGoxTGihjhkQ1WqNpZ1Xnldl8iboO/qOHMursmrWOk9w3rNRN7opLlhX9Hu5fyQyqfAnkxJD/YuZ25bf6L+CImY7VLUM8BVnYFDGCoSMZyzOELZZ9OQ+FKbO2DLLT3AH3qXe3kyW2LxN/4gqFH4ygd1jiU7wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSr+r+qL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSr+r+qL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F413E1F00AC4;
	Sun,  2 Aug 2026 02:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785637216;
	bh=Cv7kkTCkfbuNG2QrTaqkBnU6gtn4xOxKbQAsPbHIbXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aSr+r+qLvRf8sxi/tqA8YUNfbvdXGiOfcNW44AZsITdHAIqN1ck3tHKUJwjUyHJNG
	 J9CVefIYx4ysq3/0gs0LGNDqVgCV3ykqkajinz4nBw39adWlo4Ukkv8JV2Mp/wv853
	 KxA91NBABBVVv7Sf8bG9/2vhrjra1MIZmNsICS9ieo7gRJxTPaJwg+sBgLJXqbetRO
	 gGI09e+UdWML0M8ixT6UXKugiXYPzse91/cg2CqxeCqgfs6KpRy20ULKVe3oK9s5rN
	 15o2LmUoF2hVzsaqK0bVvqOLhwph8xSP9Eud1UzB5Lkc7aLSMBxBqCy1D4M2KPhrEQ
	 DTCpJB6+7fJWQ==
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 0/6] riscv: dts: spacemit: fix maximum CPU core voltage for K1 boards
Date: Sun,  2 Aug 2026 02:20:11 +0000
Message-ID: <178563718457.1616805.12139797953072589045.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729150722.1598630-1-aurelien@aurel32.net>
References: <20260729150722.1598630-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Jul 2026 17:02:17 +0200, Aurelien Jarno wrote:
> The SpacemiT K1 based boards use the SpacemiT P1 PMIC. The buck1 and
> buck2 voltage regulators supply the CPU core voltage. They are
> configured with a maximum output voltage of 3.45V, while the highest
> operating point requires only 1.050V. This means that a kernel bug, OPP
> misconfiguration, or privileged userspace could request a voltage above
> the safe operating limit, causing possible permanent CPU damage.
> 
> [...]

Applied, thanks!

[1/6] riscv: dts: spacemit: k1-bananapi-f3: fix maximum CPU core voltage
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=b496282ee4ad07311a13489e15b74fb7078d9a01
[2/6] riscv: dts: spacemit: k1-milkv-jupiter: fix maximum CPU core voltage
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=56a77ddae794ca0516fc146f6e59bb8cdf4fd9d2
[3/6] riscv: dts: spacemit: k1-orangepi-rv2: fix maximum CPU core voltage
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=ae0c38f0a24f95c8759b6b0eaaa5a0d36a7c6af2
[4/6] riscv: dts: spacemit: k1-musepi-pro: fix maximum CPU core voltage
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=f045253a03589b2616332560b4120e584342a987
[5/6] riscv: dts: spacemit: k1-orangepi-r2s: fix maximum CPU core voltage
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=d66267c35032c46c18b675601d03c80239bcd913
[6/6] riscv: dts: spacemit: k1-bananapi-cm6: fix maximum CPU core voltage
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=a65e9b73b0f0f33078b63f039b3ff64af051a11f

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
