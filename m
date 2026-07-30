Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B14C3E44EB;
	Thu, 30 Jul 2026 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401670; cv=none; b=EeLp/SL7fl6P7vl5e5q3LBWUs14oxDWXYR60C7nwpiVrqzCTD+PgBelSDJddXaxqVQ3FF1hqDhAqyY2sj2tx6Jw3abZFVRCWdNeevAL7dKJpB0LFRYFgAoUlVb5bpVd+FEU89NHbSrFi48k59XQVcsGeqEPlG3rU88ByCaElR6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401670; c=relaxed/simple;
	bh=kg7wm4Rn2DAaDAUknEYYyu47GmqMjlGONc2jmWrgMew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcKaKHoTiCF0W3I2VTT9tUZDbdsi2CbBeZOmMguWNLLwF4Uj1dXM7hJy9mH90gxUtS++FQJ07HWlKB1iHYIqAT0w2lNGaUeqO/nPgb4DgIZC5S3LOYd1UDu/GHoxw2e4S3YpW1TEkDq7t/hXgmuo6DiBqs+sw7X+I5a9cPtNgt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzNks7DH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzNks7DH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6B71F00AC4;
	Thu, 30 Jul 2026 08:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785401668;
	bh=ZByW0d9Cdpsyjv8QIk+DNR+PKdVmMUnUkPl8Y2F6nP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EzNks7DHt0sEASAszaGXmT0VsGZKL3x5FCQbWEV+Dg4vmb4IC2LkJGw1PicQkXFox
	 3ADlbxyiHOFRGb2OZl7/o/gXfwfcRx7ce0EgpTAAcca0i/RaHbd92gmPnLDi4+ojAj
	 uaGH305BQgoOzZYM5gXb+ecbC40W7uGJFjdrD1lujBQRnSK0xRGw7eDfIMVagEfFON
	 52cRH5yBlEmPtwdCSc7s53d/bYW8d/0+sw4vBXx3OqPncSqwlzh1JeqZ02hl7xVXrP
	 rmwj7e0bpcGg+jtOkEVwSbaMTlh2x6xdvSxTT4Yz5qoQUAibSe7Tm2AI20IfdSUHXz
	 5XKnkCiGNdECQ==
Date: Thu, 30 Jul 2026 08:54:24 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: Add Milk-V Jupiter board
 (M1)
Message-ID: <20260730085424-GKK76518@kernel.org>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
 <20260729160749.1621415-5-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729160749.1621415-5-aurelien@aurel32.net>

Hi Aurelien, 


On 18:00 Wed 29 Jul     , Aurelien Jarno wrote:
> Add support for the Milk-V Jupiter board with the M1 CPU. The M1 differs
> from the K1 only by its package, which provides improved cooling
> performance and allows it to run at up to 1.8 GHz instead of 1.6 GHz.
> 
> Add m1-opp.dtsi to define the 1.8 GHz operating point and the
> corresponding core voltage, based on the upstream kernel. Include it
> from m1-milkv-jupiter.dts. Raise the maximum buck1 voltage to 1.116V to
> match the new operating point.
> 
While checking the schematics, the buck1,2 provide power supply both
for cpu core and AVDD09 domain - check schematics page 9/25 [1]

the R81 is NC, so buck1,2 is actually all power supply, raise voltage will
result high risk to damage the chip (overvoltage of AVDD09 domain), so
a safe strategy would to test if M1 able to run at 1.8G without voltage 
change (still at 1.05v)?

Link: https://github.com/milkv-jupiter/jupiter-files/blob/main/hardware/v1_0/jupiter-sch-v1_0.pdf [1]

-- 
Yixun Lan (dlan)
