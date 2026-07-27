Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106A13F1640;
	Mon, 27 Jul 2026 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147229; cv=none; b=BfWoGp7VKIit/RtClhG00ePf3aRCAGvRbUp7dOnQmamC5Zq9wb1k7yza4R4PKy049oceHXPqde4GfxjwEQ9gwyBsmIeIngoKPc6Ccc4A90PGtAitLY6JjgLF/W2C5QHQhC42Y+s6b7mIhSajhyWB3uLpbvlTo3LScSS8jJQtxLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147229; c=relaxed/simple;
	bh=lCKFKB34tgMhmeSUKvwPBxohzs2CVJUNS9UyZb8KbBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d33vy5TPb01FiBZ6FeJwTEvYhgMBxfKm7Uv1ELAQx/hVucHPlFzdSLpEPHxUhkQXYJWNBJUWYYR6gB7td2qlXMyrjcawGoOKGg1K26Fzr6sLJL5qYssWFUpOEp4/8s144gPJFN03B44eHBpTfH3DfG4RNBUJ8p+SuIxGGlo7g8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8sB76Qs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8sB76Qs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C6D1F000E9;
	Mon, 27 Jul 2026 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147227;
	bh=woRPzSTKoA0odkTUKY/2dKCO4O2CXSKgHWIUqmfe7i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j8sB76QshQgP0t1qFZyR6uVoVuZ1zDdfJ9ancaxDqxbD3VHIDck96hXIiWYIueOEM
	 oNnThK93QZJwHeE8mD3oeUu61Tf+W6DM3jKPjJV7s9X8CL+ackQ7kU5P1mM67Rfqg2
	 bOhSt6zu2RpPQw4bDZ4iKFjZ5CFRFu1tbWrzP5hyVom5P65ed6UNLmw1A2NN/FZrVU
	 AlNviDgtwwuAcpeupAcvqPXMRWgqLPqdvq/FsL+agqC7K6spdiMc0h5sQn91o3AuXM
	 ARKDIet8y2+QtkMuG6PysotfTlpBbIdMJc4JygWRBiRTLX+gaB89mPn95tIxVHJAEd
	 nRiYn3nIuJUXw==
Date: Mon, 27 Jul 2026 10:13:44 +0000
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: dts: spacemit: k3: add USB controller and
 USB phy support
Message-ID: <20260727101344-GKB76518@kernel.org>
References: <20260727094726.890179-1-inochiama@gmail.com>
 <20260727094726.890179-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727094726.890179-2-inochiama@gmail.com>

Hi Inochi,

On 17:47 Mon 27 Jul     , Inochi Amaoto wrote:
> Add all USB device node to the Spacemit K3.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 13 ++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 42 ++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 

-- 
Yixun Lan (dlan)
