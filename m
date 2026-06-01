Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3706C35674D;
	Mon,  1 Jun 2026 06:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295507; cv=none; b=WtbnFV6O7LJRDjfz5q5xr8DJX02lEer6wu9YGgmDCubpgqekTp/nmxbueZ+lwOLVRWlEoizfSOE6gupw7SWNQWE+Mtk36QAmiw8OTrlLn7d0XsuVDFJYkJJL7UCzJOANRoovHmDKaUGpc76iUYfY3WsdNQFRrM9/LeUocJEKwfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295507; c=relaxed/simple;
	bh=1BjJuMfejcYeAdRAgiVOTf8QVvqeO7Hg98YMJ/fBj1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ki3J7q8IIxVKKNIhh8G6RzkUTVqI9a4VdNPGoOZriszyBu4R/G+iMf/KM0yd0D2n68YjBXjdUGoSNDPRYDXlhWK5yjznJWOUgaKaLu15sqD/2NWFzKeEvxQOOjTKzOqMNsug4qLm19uMWBmFWwfXoev090mEMPWa+0CQaSd8fh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTgy5EWu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTgy5EWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BAE81F00893;
	Mon,  1 Jun 2026 06:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780295504;
	bh=nut7/auHhQh+rbp2DQMRfJ5Ro+4NzjUEZWNJ0Mo54Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OTgy5EWuQvrJ0X/m9axOBlTuBclDwZ8YwGy5P9JGUx+7KRirsSrkIdqVDgsE2RihO
	 gASkUVFu10t3YX0+LGdAgVU0lw1y/9CdBTyhjqypmALTNtoVkwnn9A/QC+bIEfjz+z
	 Lsc3TTjQw4m0s2xoxcOgrb6ZkUnDnFHM4EsoGrq6tsJM6gxKGkUzwIbD12fX7C4jEn
	 Li/MoUvU7GlyJotUiwqZqZLspg6U3Yq+8vAUqMLWgaqUvFjbwYO5ljpZ8bUj/heRn9
	 UemXa5JzmAvts7TVHnfn2RP2xheifxsOfpaFtWsYNR9lj6tnp+4ySdaYavW37uhKWh
	 h9K8PCt8jvd+w==
Date: Mon, 1 Jun 2026 06:31:41 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable PMIC on OrangePi R2S
Message-ID: <20260601063141-GKA3815935@kernel.org>
References: <20260520100000.575719-1-amadeus@jmu.edu.cn>
 <20260530021021.1167953-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530021021.1167953-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 10:10 Sat 30 May     , Chukun Pan wrote:
> Hi,
> 
> > Enable the i2c8 interface and add the connected SpacemiT P1 PMIC and
> > its associated regulators to support voltage regulation on the board.
> 
> friendly ping

Ok, will take it, so

Reviewed-by: Yixun Lan <dlan@kernel.org>
-- 
Yixun Lan (dlan)
