Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46C72BD11;
	Tue, 26 May 2026 04:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779770892; cv=none; b=bMQH+VDRqj6iBAWClE87PEUCyYSBwAY0GVfj7UBRgL/q0LKkQoXWG7dQUjEUidbs9kzXfJW1OCS1ttDDvARVc+K/Vl0s1/zgrfjosaR3d4QS+xoJobKEDb5/b4bS0iRcgZkhaQR/zNhWDpMK8povXGgtGRT6yIQLKSgoTPunLto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779770892; c=relaxed/simple;
	bh=SUtNPWzFD5t+h1ecCR6QbYXITUB4wllnivqOM+s1Puk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGzFOG7d1rjtH56WCjfazn6xVG6+chTEeap/9tBCWqNUUN8ezaqDhom5P92FllkXfVNuzLIoCJ3v++65j5PLTBBxLEkMke/t1oV136Umv0/X2q2Js4wN5Cmlag6up9i0qU1QPZI5EnOR4f6pKCG1mjblNPr77O0GJxR3dOv+iCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJlgBL5h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJlgBL5h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1AD1F000E9;
	Tue, 26 May 2026 04:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779770891;
	bh=1NEJLKo37Ve3sSi9fF3jtlIXIxD3NOka5l+Y/9sfLuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJlgBL5h65cDlNcBAsEY/xeIS06gMA9SwlZoxMRSu8gVxrybyP0EzPAqb8KBjPjbd
	 a5Yap1XMmiJMDUVQ/grIFNnJ0sJOssCvxgyBJZfJRUJp9wR/rN23C3gl1Oq4edj5zu
	 63WHEFDGYVLiNqoadrio4pIeou7aM6aTZqlt7vN4jx97gLO2p7wwbk2YHmtgRirOQX
	 LofIrER6ktjiU6lv0sTBxvryEQM2jySpSp9G687yQNrf10/qE3yOvyAdoC7WokT5LT
	 AI5NRYHhE1PCTKQySALfGfBe05IQWmZw0LHdZluXkfuOAokot+wYCWzjYvyTguShm2
	 Th6rpoJjQyxMg==
Date: Tue, 26 May 2026 04:48:08 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Paolo Abeni <pabeni@redhat.com>, Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref into
 independent pinctrl groups
Message-ID: <20260526044808-GKA3727415@kernel.org>
References: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
 <20260522-bpi-cm6-v1-2-707ef1917a30@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-bpi-cm6-v1-2-707ef1917a30@pigmoral.tech>

Hi Junhui,

On 18:01 Fri 22 May     , Junhui Liu wrote:
> The gmac_clk_ref signal is optional for the GMAC controller and is not
> strictly required for all hardware designs. In several already
> upstreamed K1 boards, this signal remains unconnected or the
> corresponding resistor is marked as NC.
> 
I've not checked all exist boards which already accepted by mainline,
but just ask, to be sure, none of them actually used clk ref pin?
otherwise we will result with a broken GMAC/Ethernet driver..

> Furthermore, the pins for gmac0_clk_ref (GPIO 45) and gmac1_clk_ref
> (GPIO 46) may be used as GPIOs for other functions even when the
> Ethernet controller is active. Splitting these into independent groups
> avoids pinmux conflicts and allows boards to use the reference clock
> signal only when it is actually needed.
> 

> Fixes: 60775f28cfb7 ("riscv: dts: spacemit: Add Ethernet support for K1")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

-- 
Yixun Lan (dlan)
