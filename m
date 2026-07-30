Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E92F384228;
	Thu, 30 Jul 2026 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399869; cv=none; b=nTx6FpJ4vXNHAVFA7UAK1dCkKUFVxtmaQaaNmSBgsGHostk//oHcSM5QrvNjIYlN1CU96U7W1x043VqSxX3ZzBytqod8O/lH4BGfQTHV8Va7kSpCUeQLGVswXWfdjEpcZn6zSEbogndTr0C2YPl2b3jqVK+bZ4I481ol/IC6DQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399869; c=relaxed/simple;
	bh=1/FkdJ1XHDz3e+hgdrWmTesSkc9nWs1oUS/1VF1fnmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VV8Uw77n9APaN0EqdwrMYu3QdQIwUTM05qUYLCjMJv9eeXvAYQy9GnwFL4qMSH4t5HwWAsEgrIYfMdZjIHBPDYPZFeelejsthAtixPOWhkQNjQyUHm7Zk+s4+2Gc2XzobB58iNX4ItgnKAlKqs3XPq7L1aUCqJUtZxGSkz6B/MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T52Barie; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T52Barie"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2851F00A3A;
	Thu, 30 Jul 2026 08:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785399868;
	bh=tcJa329W3/e6mUiBMBCdmFBaRvkhjOBRJYVoU6ghT5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T52BarienqBSQp1RDkFSz8cteddwXzZFIyji1BBlWcXWtG/f95dqPzuI2LiOnxKTw
	 gYGRtbUKScrl137mLfqJs+D6PmDbeCdeyzXz1cC0B8DWtj2t1MRJEV3ApVSiz9qT71
	 ipwnwlez/SESwfBCgZqpRZeImxqrUSX3RdNLzdKs1oTEMkoo93GJ5y+M1IYOpG80f8
	 bCXenr88Zs721qFkCZgSq00N5nED46PN2tUw6bKVjo67hh5tMSc6um5p+dHIk/0Jja
	 /HszVFGCO7fkpxv90QkcwNRRgT6hP7BAy1MkdQG+prk9tneBSMqmc42/66xNr9srE1
	 hkVrJ8NXVd6Aw==
Date: Thu, 30 Jul 2026 08:24:25 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 0/6] riscv: dts: spacemit: fix maximum CPU core voltage
 for K1 boards
Message-ID: <20260730082425-GKJ76518@kernel.org>
References: <20260729150722.1598630-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729150722.1598630-1-aurelien@aurel32.net>

On 17:02 Wed 29 Jul     , Aurelien Jarno wrote:
> The SpacemiT K1 based boards use the SpacemiT P1 PMIC. The buck1 and
> buck2 voltage regulators supply the CPU core voltage. They are
> configured with a maximum output voltage of 3.45V, while the highest
> operating point requires only 1.050V. This means that a kernel bug, OPP
> misconfiguration, or privileged userspace could request a voltage above
> the safe operating limit, causing possible permanent CPU damage.
> 
> This patch series set the maximum regulator voltage to 1.050V instead.
> There is one patch per board in order to ease backporting to older
> kernel versions.
> 
> Aurelien Jarno (6):
>   riscv: dts: spacemit: k1-bananapi-f3: fix maximum CPU core voltage
>   riscv: dts: spacemit: k1-milkv-jupiter: fix maximum CPU core voltage
>   riscv: dts: spacemit: k1-orangepi-rv2: fix maximum CPU core voltage
>   riscv: dts: spacemit: k1-musepi-pro: fix maximum CPU core voltage
>   riscv: dts: spacemit: k1-orangepi-r2s: fix maximum CPU core voltage
>   riscv: dts: spacemit: k1-bananapi-cm6: fix maximum CPU core voltage
> 
>  arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 4 ++--
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++--
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++--
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 4 ++--
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 4 ++--
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 4 ++--
>  6 files changed, 12 insertions(+), 12 deletions(-)
> 

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
