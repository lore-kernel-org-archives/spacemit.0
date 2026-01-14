Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72FA345CBC;
	Wed, 14 Jan 2026 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768418576; cv=none; b=oDzlU3F4yZaSC1Q/Pc61nOiCoDJpP1llfKWH03Zt5x3Y3heuR4Q4AwbSWtZcZXT6o9p2g334wI2mKpnjF1Ty5Rbkrg2HRKlUSv90kF7CbUGwzMLWIH+cXwe1hJyqH3vgAwyjlR02wV0mXv1sK5Gr3QaQk6fhzwy1qLe3UNdJ4fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768418576; c=relaxed/simple;
	bh=iS35d3PWnlOuU7WvThznMhQLwXxW6GhgS5samZ6duos=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=itJ4dYcXb7vyfTGqu+sSUDUS6gyryx8hDe3/j6gP/gs24c0lTH8Z2WdvQo8+Ovuea4PwAAyr0nt/FygmsRc23UAnskJTPXMcHwbAQWBPR+UuKIg9Em2+jAV188Mvaz28qpsWTPqXdcm79MP8XEEB2Ea45lQViH8NruCIvoY3CBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rDQpmmqF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rDQpmmqF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1686CC4CEF7;
	Wed, 14 Jan 2026 19:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768418576;
	bh=iS35d3PWnlOuU7WvThznMhQLwXxW6GhgS5samZ6duos=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rDQpmmqFkeupsSOl12q1y9zFYHntvwGW9vMtaytYTfItSQZOdu97oWh5reeenfcVg
	 4NYUysNbZdpat832NxXVpNiv4zIcon6aRSzviOG8uqu9tiwmNeDn+T5hDSTvjClFTy
	 MtHY+zdyGx+S73i5bSWYBHCDLWs0R2dieFoiSHJnYaX/4+EJ4CR3/tCtq7M/+S4LUW
	 DIPcG8GoMEf4hsKJduLZhJ3BpXU6wLCxfuiTmL+ssY2+AaLLPKZhOPA1rjv9jG1W7G
	 n112uY6qncIDVvRv8CdsMFjwLs8dQUEK5cNjZqMeL1bwkahjn2edmQ4KM1+doJtLmA
	 98Uh2ANw0vFVg==
Date: Wed, 14 Jan 2026 12:22:54 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, 
    Guodong Xu <guodong@riscstar.com>
cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
    Yixun Lan <dlan@gentoo.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
    Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
    spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] Documentation: riscv: uabi: Clarify ISA spec version
 for canonical order
In-Reply-To: <20260113-adding-b-dtsi-v1-1-22d6e55d19df@riscstar.com>
Message-ID: <dc610e3e-48f4-5df4-4929-fafeab9c381f@kernel.org>
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com> <20260113-adding-b-dtsi-v1-1-22d6e55d19df@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Jan 2026, Guodong Xu wrote:

> Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
> Unprivileged Architecture. The chapter numbering differs across
> specification versions - for example, in version 20250508, the ISA
> Extension Naming Conventions is chapter 36, not chapter 27.
> 
> Historical versions of the RISC-V specification can be found via Link [1].
> 
> Link: https://riscv.org/specifications/ratified/ [1]
> Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Conor, want to take this one if you pick up the subsequent patch?  If so,

Acked-by: Paul Walmsley <pjw@kernel.org>


- Paul
