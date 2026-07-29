Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0242C236B;
	Wed, 29 Jul 2026 01:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288766; cv=none; b=l1KPnMugK6nWLhgRvZMOEgxZi+8wQfQeJ/fZmAFNs6T0H+UuOzHBJcbtvwlEOqOPVtwazqSXX5psxCQQtvkv/iM5deCpXJfaJtcV9mUTkDjhAHokiIOEzHLzrjj6vyd1ngvGobVNqsFytq4xUmywoIPd9OjGUyLfOD5q8q/GzdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288766; c=relaxed/simple;
	bh=1T2H/aPVxKO/SLNI7IlNwEpPJYX08wgu+eGV1YK9PUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpmDFGfmKpyXVE5th7TmOmiAXOZ4GugQLIXbHayGtFyrnT6VjRhXunw+Xai6ZSDB0B9Gkby6AqQA4R7XIRCPQiFHmIv96LdHi9/qi8xs6IASunTeoakrVlZNbwguLcgJt6UMlAcxugMYKBg5WtvsTfd53hau5sH95YwBbEjgJCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaclXzUZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaclXzUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2111F000E9;
	Wed, 29 Jul 2026 01:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785288763;
	bh=7/1vNgc73oUJAQ9jeWlv9XTN22Njv2ujKAJbi0E3Hk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TaclXzUZou33aqg/wC8VycBxFb0v1++NW2j22jqfztgGfvviNA2C5oxwUUS48cLYy
	 F+qX0ueL/t8YJdbqIqFMM1flg5doJxB6RGHkx040aw9jqtQcyn18VExJLi1tvqV0Z3
	 VHUZRcg8mIHSewhNMttx2L3Twlj1X42+BQ14HPWmH773FdB3j0lpPiht7twWYC3ksw
	 vtIqvBxRyIDLK66jrkPwNT0Ebt6AiJD3rrc0dhMVseOJ7ytjJmBbTmFsRIu/Yajtyc
	 yvBfdw2atuJAgcm0NMPYASFWwBAib6iIkgLGWnAfgxNEnA1FLJXduEYn3Z0JqxYxvz
	 VhUJhIMMLUhKA==
Date: Wed, 29 Jul 2026 01:32:40 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add cpu scaling for Milk-V
 Jupiter
Message-ID: <20260729013240-GKF76518@kernel.org>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728211020.1248676-1-aurelien@aurel32.net>

Hi Aurelien,

On 23:05 Tue 28 Jul     , Aurelien Jarno wrote:
> This series adds cpu scaling support for the Milk-V Jupiter boards.
> 
> The first commit adds it to the existing "Milk-V Jupiter (K1)" board.
> 
> The two following commits add a "Milk-V Jupiter (M1)" board, by moving
> the common part, i.e. everything but the model name and the operating
> point tables, in a shared DTSI file. This file is then included for both
> K1 and M1 variants.
> 
> CPU frequency scaling was verified up to 1.8 GHz on the M1 board.
> 
Looks good to me, will queue for v7.3, thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>

> Aurelien Jarno (3):
>   riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
>   riscv: dts: spacemit: Add a common board dtsi for Milk-V Jupiter
>     boards
>   riscv: dts: spacemit: Add Milk-V Jupiter board (M1)
> 
>  arch/riscv/boot/dts/spacemit/Makefile         |   1 +
>  .../dts/spacemit/k1-milkv-jupiter-common.dtsi | 469 ++++++++++++++++++
>  .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 433 +---------------
>  .../boot/dts/spacemit/m1-milkv-jupiter.dts    |  11 +
>  arch/riscv/boot/dts/spacemit/m1-opp.dtsi      | 117 +++++
>  5 files changed, 601 insertions(+), 430 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter-common.dtsi
>  create mode 100644 arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
>  create mode 100644 arch/riscv/boot/dts/spacemit/m1-opp.dtsi
> 
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)
