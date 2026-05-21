Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4516A3CDBDF;
	Thu, 21 May 2026 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369660; cv=none; b=DnITYB767Y/MvjDfPe4Do+4fSFORf5Z6dodBPGKW3KAQ8NcmSU7rEIMWncjM/urBoap6tt/z6YC9urIgAqN9ZMqazMHiXh9xWGdRnzB4GT3W2yyg9eWxdf1Ps98/GcBkPUN5ZBW3aj1jxGA33V07hdjzcIIXgy/D4EGq6MKGDSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369660; c=relaxed/simple;
	bh=wPRaItvI5xedR8CUepoovU95vdEtVgFHkwA4aBMp70E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYZdr+OZ+CLjEirVm3+Tu5gMW2Z24TW7z9b0OOfyN2dfoeJ7rBvAjE7muBYs4s5D4LdMA6OUk+WlxbP9wXWr+0EYGUypCtVb0f+8h/3vvM5r0vRMjOZ9Bs+xFd+chGuCOJKvXsdUx0dAGfTr6RfGs39looCpANfNccN54tn2m+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AG+k7slS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AG+k7slS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5191F000E9;
	Thu, 21 May 2026 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779369658;
	bh=W4c0w+85Yroc3WjrLcNvUhZ+QTTqOpJpxTVRvh4y9fY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AG+k7slSRH0fb4MPPbObLlKFoWufoiyknYcfeA5aehfLmQKE0rl7NLQgSXV0nqo7M
	 InIISPyZQnWZugAHbjZNBdx1pOyO2k6zfxIHgyU4z4Kv9edoX+2hjpgDOFrqIftHuP
	 OwormusB0+lsDvp+u9gBh9mvaBzVHpOBSRsCOEL0+YAQk0/nkhewTum9Z0viQUNPq4
	 j+VpL7rGWyYTCZ7YAWvUc2wlzUhg02yD1Xr7Fl7mwFSP/gPFd7L+UyQRJIFk+jskq7
	 E8/LwB/ddcikUe4QQxh2pgA2qEw3OIMDJp518yd8vK1nJsHejk3NsnT/3txWykxDW7
	 j74Ig931IIcqg==
Date: Thu, 21 May 2026 13:20:56 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 0/5] riscv: dts: spacemit: improve Milk-V Jupiter
 device tree
Message-ID: <20260521132056-GKB3727373@kernel.org>
References: <20260519041458.3287843-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519041458.3287843-1-aurelien@aurel32.net>

Hi Aurelien,

On 06:12 Tue 19 May     , Aurelien Jarno wrote:
> This patchset updates the Milk-V Jupiter device tree to align with the
> changes recently done for other SpacemiT K1 based boards, including
> enabling SD card support.
> 
> Changes in v2:
> - Rebase on linux-next, which includes the SD card support series for
>   the K1 SoC
> - Mark the eMMC as non-removable
> - Add patch to fix uboot partition offset
> - Link to v1: https://lore.kernel.org/linux-riscv/20260514160356.1642075-1-aurelien@aurel32.net/
> 
> Aurelien Jarno (5):
>   riscv: dts: spacemit: set console baud rate on Milk-V Jupiter
>   riscv: dts: spacemit: sort aliases on Milk-V Jupiter
>   riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
>   riscv: dts: spacemit: enable SD card support on Milk-V Jupiter
>   riscv: dts: spacemit: fix uboot partition offset on Milk-V Jupiter
> 
>  .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 38 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 
> -- 
> 2.53.0
> 

Applied all, thanks, please check 
  https://github.com/spacemit-com/linux/tree/dt-for-next

(P.S this series can't be applied cleanly on top of dt branch, so I
resolved it manually which break the "b4 thankyou" command..)

-- 
Yixun Lan (dlan)
