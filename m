Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B881427EC76
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 19:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744399902; cv=none; b=co3iu7ZutJZhQRNHMPpff+u4gTN5TPuflXp2lbAdVttcGK6YbpEzSr2mqEmEBKOr1deqoS8DZbQI7XLpyJ0C+zVxd8RoxaSj5uXftJxdOPXnhQcKftEEIJUsVymKL5tdPs7xd9BKVgG16Q4bpdEQrwa4Y3KLsEb3zylmNYahCYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744399902; c=relaxed/simple;
	bh=OYfHEfa8QuOBnyzwI+6jqRFVv8kLSMlrRiyOwBu97Lk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNcStp1GAlIQ0hbP3u/RolL/mSTCQA0bgHoHDYcR9RhM+3uvQQyyq0xPRzI4QB4A84hPrh0kWymlvy2L0w5UYwTnbEGrgJqelVLeaE2dZN1kdlEniaDsizU3B50t/iOE0EIVlSCAxZUC5qTOGpCQkyisDVtfAdw2IwGPrrjZay0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 9238f596-170b-11f0-963f-005056bdd08f;
	Fri, 11 Apr 2025 22:31:31 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 11 Apr 2025 22:31:30 +0300
To: Alex Elder <elder@riscstar.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
	benjamin.larsson@genexis.eu, bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com, u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk, devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] serial: 8250_of: add support for an optional bus
 clock
Message-ID: <Z_luEj85iz5n8vhQ@surfacebook.localdomain>
References: <20250411154419.1379529-1-elder@riscstar.com>
 <20250411154419.1379529-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411154419.1379529-3-elder@riscstar.com>

Fri, Apr 11, 2025 at 10:44:17AM -0500, Alex Elder kirjoitti:
> The SpacemiT UART requires a bus clock to be enabled, in addition to
> it's "normal" core clock.  Look up the optional bus clock by name,
> and if that's found, look up the core clock using the name "core".
> 
> Supplying a bus clock is optional.  If no bus clock is needed, the
> the first/only clock is used for the core clock.

Okay, it's slightly different to what we discussed, but at least it looks much
better than previous version and acceptable in my point of view.gq

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


