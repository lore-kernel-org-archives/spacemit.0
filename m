Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCBD32B12F
	for <spacemit@lists.linux.dev>; Sat, 20 Jun 2026 09:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781946226; cv=none; b=V/f1p9p1v5kPp+6cR6DspY/iQf8jRCxck9HZqo8Y+Oz+RDFyvGOMXsdhSVYhL0HZRiCb7pGq/TtP2rfsoo4Pm1O3w3P8bNgT4gJuibYY9qS1AwDtRTh8HXwSuVUJLAf0mzzvzHJDO5jzzNWc29OZMOqpD4uKnDKhsqzDJTgtMMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781946226; c=relaxed/simple;
	bh=s2B3Es+EqU2cD4MTpv6p/BPR1jeYHzBxcUAjQLNDi/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCR4jrNxIgnT751zxFnlFOL1DVqjf78JtO3hhMyFPdrC6xU3kMGw9FASD45UR4Hp5ntUi38VwGzDRt7FPzAGqXmFel6l90rlAOQpCFcDT3I343LhKNU2tGmjQ54PBTUAOWX4i8i7Q7xZWsPHW3gYhQeXBiyDzVypDq/poE1pZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hk5KT5If; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hk5KT5If"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84231305a80so1698100b3a.0
        for <spacemit@lists.linux.dev>; Sat, 20 Jun 2026 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781946225; x=1782551025; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vnaC9u5H2wJSRqMHidcxYwZxkhPyhVvcFpavNr1emCs=;
        b=Hk5KT5IfYGiOlno9+0wtcYM/gHU/rQ3p3ZYDsV37yR6cHIDzPGNo+Qfy4R0XDn8D1S
         0Vkcn66Ixd+EqrMNt4t11FrPfFG9WHuQFmmNAt5PUuPHS9C0Sh0R1l7TCy/jRss8LV6p
         LzZhHlr3YAdmNKj49aIAb80eBQH2KpxWi1qCLMT9Sj6x9Yvrqk5g8VPghpi7o8zFtTUX
         I9PDbCdjbf0L5XaIMsWsI/H1kLRTtCg9oySmL9rpF2seqUhnVThkS/zZyuqhaZbp7FAW
         5bc94UryfCOzgFBAWvJqQpsGgXy56O9Me6NMsOK25IL9TPAWf/GIEeR8pF6T6ixGz3Mg
         uc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781946225; x=1782551025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnaC9u5H2wJSRqMHidcxYwZxkhPyhVvcFpavNr1emCs=;
        b=YlfzE5yvvxMu3XIk1ILbXlggTrrje7OyAhCWA/ObFUlQ3Wr0XqKsap4/OhzLi7qlYi
         yNhSFcSYdsebDJVoyysWtydfkI/zQj+LPjumuyqI232bJ37JJXZF31miaaC+FWGf+zsg
         tCmUSTiO0z8afPxb/0QOCqwmyHFVRmZAvZQVjx3bcNh24GXvpylHgrXzrYEAWgXWHy4B
         MeHTOErObRm1rjPWanYsdKwgd0/DDT2/jksAFvTZ2/OWNngIZvmcD0rfsxsyv0iCaRG9
         A0v3tviPa3CIQBYvFufuSeUbfTURathL0ylR1M8zZ8N87e8R21eJhFGv11J0zUuhgZfq
         pU5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8svtvZ3HpabRSJTzJ2qoAf1h8q8Dy1RfKwW8pTmVQP5neIQEHecrOjKHEWPIBhQtj56oV4eCuJUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGOE7ewXqOxAfeIfUThvsTbtYM4i6W08maYeatAhR3aK6+1PFJ
	C6BnQ2QYTL+b+xuFYb0lJLdLQ7vI9hA3TP5NFf/cea5qPeXlTCUKmXVy
X-Gm-Gg: AfdE7cmoV3kaCqXdWJz+c4wbvWxDJRDUD9urXr5aKyEFkfOB2GCpP3nO5q+NkoRqEqa
	bONOl2YM+7fbCz7kBZRcqLLwCSRj0r06+9yt5wxwaOhBJBD+jurYZd7oci72QKnt3cIOeqi+teg
	ftOwY7imL6DDh1EvyHJN/7NgA1tbcr208IK9uXgABDtYXlJnGOSSKH2yism7dMkPkWSlrT6KGut
	MAssejBZ2aM7j31BzDE4TvW5t6TmsZsiXTjKd5cVaq1cnWjTHi/c/Y8Kjw2Q/wGG63SNOqiKzTe
	+zsFnIGo0+QRv/4wlxd/zUSGJdSoe+3Xwew3zg8iYYU263bVPdSotHaBb3r429zmuwd6ZR/jLqy
	GNs/uX57og7/6xilKepaVQsDOHCxzqsw9m2MgGdhAuqvQfZN8dDYLpc5PQpZj
X-Received: by 2002:a05:6a20:431a:b0:3b4:640e:f6b1 with SMTP id adf61e73a8af0-3bb32914066mr7723228637.10.1781946224670;
        Sat, 20 Jun 2026 02:03:44 -0700 (PDT)
Received: from localhost ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc374375csm1885419a12.13.2026.06.20.02.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 02:03:44 -0700 (PDT)
Date: Sat, 20 Jun 2026 05:03:36 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Guodong Xu <guodong@riscstar.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/5] riscv: dts: spacemit: set console baud rate on K3
 Pico-ITX board
Message-ID: <oktm3eodc7xk3cdvxtjudycofa2rgddczh77zz5neef5w2mzzd@sh46luoxt2ln>
References: <20260620062238.3199108-1-aurelien@aurel32.net>
 <20260620062238.3199108-2-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260620062238.3199108-2-aurelien@aurel32.net>

Hi Aurelien,

On 2026-06-20 08:22, Aurelien Jarno wrote:
>Because the default console's baud rate is not set, defconfig kernels do
>not have any serial output on this platform. Set the baud rate to
>115200, matching what is used by U-Boot etc on this platform.
>
>Fixes: 7a6131804986 ("riscv: dts: spacemit: add K3 Pico-ITX board support")
>Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Thanks for the patch.

Reviewed-by: Guodong Xu <docular.xu@gmail.com>

>---
> arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
>index b89c1521e6649..509cebc0c9568 100644
>--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
>+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
>@@ -18,7 +18,7 @@ aliases {
> 	};
>
> 	chosen {
>-		stdout-path = "serial0";
>+		stdout-path = "serial0:115200n8";
> 	};
>
> 	memory@100000000 {
>-- 
>2.53.0
>
>
>_______________________________________________
>linux-riscv mailing list
>linux-riscv@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-riscv
