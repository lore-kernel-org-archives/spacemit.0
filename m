Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBA62C027F
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862145; cv=none; b=miy3LINB/C6fa7nTgs+6V6SKavbbETiHKICg1RPitDGa3tTPZcIrx8SE2VWDLFDN5z4KEwKaqQJj7vHQYngk+3urVj9a7C/TnhHpMvq7ioZWOP2HEbdDnRLau8aJMsbJ2MoMw3L3tie6wC4ARXI+lMpWmzvvQ77ES2KXWuGKDgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862145; c=relaxed/simple;
	bh=a8YvugJH+t8gjC+U2aNmb6hmFv51p6ka7JzEV8FgDjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mockrGz9y+dTuj1nVF8Iw59G7AClYZMRmB6yEIkgVaYxvJ9RqtK04UnSIvqmsuQ6RBO4ErLRZeytw8xvpe+nR5AiBFRJiWdVIuUUmmf4VLuDahuQ9vbs8mQ2bPCxVKIsO0uwYbyT6nN8S1jdeGwAoj8hi5Lp9BU1BpmodvunYw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lxRPe8nd; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lxRPe8nd"
Date: Mon, 30 Mar 2026 17:15:34 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774862142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ffNey6SOjj6PKeMnJLurYQewyxdkCi4z/62Wjxr/TDg=;
	b=lxRPe8ndEyU517wIcgrl2IHaTXvpw4dbrzkXLqhOImcJA1Z/hSzUM6VLjXmAqBlFWoeSXU
	2UblgqPB0rl3E6gSUr9lMritOmbjAkUdGa27ie9MMebNPGClDFgHJ/Nqp/ZZujsEsftLsA
	VmYg3LRd4F+Q8Nz738sYapqFq3A6c8U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v5 3/9] mmc: sdhci-of-k1: add regulator and pinctrl
 voltage switching support
Message-ID: <aco_NocWwrkGdTaK@kernel.org>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-3-bd853604322d@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-3-bd853604322d@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Mar 30, 2026 at 16:38:04 CST, Iker Pedrosa wrote:
> Add voltage switching infrastructure for UHS-I modes by integrating both
> regulator framework (for supply voltage control) and pinctrl state
> switching (for pin drive strength optimization).
> 
> - Add regulator supply parsing and voltage switching callback
> - Add optional pinctrl state switching between "default" (3.3V) and
>   "state_uhs" (1.8V) configurations
> - Enable coordinated voltage and pin configuration changes for UHS modes
> 
> This provides complete voltage switching support while maintaining
> backward compatibility when pinctrl states are not defined.
> 
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
