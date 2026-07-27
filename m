Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F1F2367CF
	for <spacemit@lists.linux.dev>; Mon, 27 Jul 2026 01:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785115410; cv=none; b=dJpT1fbzwp1oYlmIjg3qaj5y6oUgCTMhtii7po+5QAdYC1C8tBzBejyldMiGguOzB5uzY/1F3+ZC77Io4pafsj3GaqYPYnvGP9Y0Z201TUoHOPRxm7zREIjQJtJfz5wZ+8WjOAT3CIo9faSga0NBCrSOlyvzSwlCfKMl4bL+CRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785115410; c=relaxed/simple;
	bh=Bveg9tUpLvJ6brn7oQydeacLalvrezQCp6eprkRB5wo=;
	h=Date:Content-Type:To:Cc:From:References:Mime-Version:In-Reply-To:
	 Subject:Message-Id; b=B7u4wYG/OYWoT30h+DnCc5A6FcUI8vvq8Uyyv4ZTwtpuNh9YjpZwlVTAnGkGHXKv+NiFNhS31Fn+WHdTt+RalA3rrV6S98X2ah5KZUpPAicMjS6Xl8b2Xk09KMxMy/+BZmg16WYOZDblEQHsQposOQ2serTMt+KkmJ1kIKl4Sz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacemit.com; spf=pass smtp.mailfrom=spacemit.com; dkim=pass (2048-bit key) header.d=spacemit.com header.i=@spacemit.com header.b=epV3NNhf; arc=none smtp.client-ip=209.127.231.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spacemit.com header.i=@spacemit.com header.b="epV3NNhf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1785115398; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Bveg9tUpLvJ6brn7oQydeacLalvrezQCp6eprkRB5wo=;
 b=epV3NNhfGImHyivJ7bohBzZMJ0W0lIJjtE3C7bAjE6fRrNNLkTzRg8+MNPwo97r05J5lwF
 71p73XSojnYGMJYBE/sQ0gwIHKU2jzZygTvA+U5D2OMH6sCU2ajO68UVQPpt9CELJDYb5i
 OT0uXA2K6NnEg6NMwKUyU9CmIWC1fedWhcXb+CLm9S/w8ATfTZijgEI8et8vcKKU65itmF
 PhjE7PSJu9GbDCF10oy0BlFCJfcc0lQk6YOwFELMtlvrpGOxiNui5AbOeWq68ZuTRQW1b1
 8ml5mCEiwQIBlLhD3zUAzyrGLXoMpLa4A+Dsl0G+8w5xxwx24FQagna+6hVhuA==
Date: Mon, 27 Jul 2026 09:22:30 +0800
Received: from snode5.. ([120.237.158.181]) by smtp.feishu.cn with ESMTP; Mon, 27 Jul 2026 09:23:15 +0800
Content-Type: text/plain; charset=UTF-8
To: "Frank Binns" <frank.binns@imgtec.com>, 
	"Matt Coster" <matt.coster@imgtec.com>
Cc: "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, 
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>
From: "Sterling-Ash" <baihui.liang@spacemit.com>
References: <75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com> <20260727012231.1025210-1-baihui.liang@spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727012231.1025210-1-baihui.liang@spacemit.com>
X-Lms-Return-Path: <lba+26a66b304+a35673+lists.linux.dev+baihui.liang@spacemit.com>
X-Original-From: Sterling-Ash <baihui.liang@spacemit.com>
Subject: [PATCH v2 1/2] dt-bindings: gpu: img,powervr-rogue: add spacemit,k3-gpu
Message-Id: <20260727012231.1025210-2-baihui.liang@spacemit.com>
Content-Transfer-Encoding: base64

QWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBJTUcgQlhNLTQtNjQgR1BVIGludGVncmF0
ZWQgaW50byB0aGUNClNwYWNlbWlUIEszIFNvQy4gSXQgc2hhcmVzIHRoZSBzYW1lIGNvcmUgYXMg
dGhlYWQsdGgxNTIwLWdwdSBidXQgaXMNCmtlcHQgYXMgYSBzZXBhcmF0ZSBjb21wYXRpYmxlIGVu
dHJ5LCBzaW5jZSB0aGUgSzMgaW50ZWdyYXRpb24gZGlmZmVycw0KZnJvbSBUSDE1MjAgaW4gaXRz
IGNsb2NrIGFuZCBwb3dlci1kb21haW4gcmVxdWlyZW1lbnRzOiBLMyBvbmx5IG5lZWRzDQphIHNp
bmdsZSAiY29yZSIgY2xvY2ssIGFuZCBpdHMgR1BVIHBvd2VyIGRvbWFpbiBpcyBlbmFibGVkIGJ5
IHRoZQ0KYm9vdGxvYWRlciBiZWZvcmUgTGludXggYm9vdHMgcmF0aGVyIHRoYW4gYmVpbmcgbW9k
ZWxsZWQgYW5kIHN3aXRjaGVkDQpieSBMaW51eCwgc28gbm8gcG93ZXItZG9tYWlucyBwcm9wZXJ0
eSBpcyByZXF1aXJlZCBmb3IgdGhpcyBwbGF0Zm9ybQ0KKHVubGlrZSB0aGUgb3RoZXIgaW1nLGlt
Zy1ieG0tNC02NCB1c2VyKS4NCg0KTm8gZXhpc3RpbmcgY29tcGF0aWJsZS1zcGVjaWZpYyAiaWYi
IGJsb2NrIG1hdGNoZXMgc3BhY2VtaXQsazMtZ3B1LCBzbw0KY2xvY2tzL2Nsb2NrLW5hbWVzL3Bv
d2VyLWRvbWFpbnMgYWxsIGZhbGwgYmFjayB0byB0aGlzIHNjaGVtYSdzDQpnZW5lcmFsIGNvbnN0
cmFpbnRzLCB3aGVyZSBwb3dlci1kb21haW5zIGlzIG9wdGlvbmFsLiBUaGlzIGxlYXZlcyByb29t
DQpmb3IgYSBwb3dlci1kb21haW5zIHByb3ZpZGVyIHRvIGJlIGFkZGVkIGxhdGVyIHdpdGhvdXQg
YSBmdXJ0aGVyDQpiaW5kaW5nIGNoYW5nZSwgc2hvdWxkIG9uZSBldmVyIGJlIG1vZGVsbGVkIGlu
IExpbnV4IGZvciB0aGlzIFNvQy4NCg0KU2lnbmVkLW9mZi1ieTogU3RlcmxpbmctQXNoIDxiYWlo
dWkubGlhbmdAc3BhY2VtaXQuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dwdS9pbWcscG93ZXJ2ci1yb2d1ZS55YW1sIHwgNSArKysrKw0KIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbA0KaW5kZXggYTFm
NTRkYmFlM2YzLi4yZDU4ZGQ0MDc2YTggMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwNCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbA0KQEAg
LTM4LDYgKzM4LDExIEBAIHByb3BlcnRpZXM6DQogICAgICAgICAgICAgICAtIHRoZWFkLHRoMTUy
MC1ncHUNCiAgICAgICAgICAgLSBjb25zdDogaW1nLGltZy1ieG0tNC02NA0KICAgICAgICAgICAt
IGNvbnN0OiBpbWcsaW1nLXJvZ3VlDQorICAgICAgLSBpdGVtczoNCisgICAgICAgICAgLSBlbnVt
Og0KKyAgICAgICAgICAgICAgLSBzcGFjZW1pdCxrMy1ncHUNCisgICAgICAgICAgLSBjb25zdDog
aW1nLGltZy1ieG0tNC02NA0KKyAgICAgICAgICAtIGNvbnN0OiBpbWcsaW1nLXJvZ3VlDQogICAg
ICAgLSBpdGVtczoNCiAgICAgICAgICAgLSBlbnVtOg0KICAgICAgICAgICAgICAgLSB0aSxhbTYy
cC1ncHUNCi0tIA0KMi4zNC4xDQoKVGhpcyBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudCBhcmUg
Y29uZmlkZW50aWFsIGFuZCBtYXkgYmUgcHJpdmlsZWdlZCBvciBvdGhlcndpc2UgcHJvdGVjdGVk
IGZyb20gZGlzY2xvc3VyZS4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9m
IHRoaXMgbWVzc2FnZSwgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgYW55IGF0dGFjaG1lbnQgZnJvbSB5
b3VyIHN5c3RlbSBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYnkgcmVwbHkgZS1t
YWlsLiBVbmludGVuZGVkIHJlY2lwaWVudHMgc2hvdWxkIG5vdCB1c2UsIGNvcHksIGRpc2Nsb3Nl
IG9yIHRha2UgYW55IGFjdGlvbiBiYXNlZCBvbiB0aGlzIG1lc3NhZ2Ugb3IgYW55IGluZm9ybWF0
aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UuIEVtYWlscyBjYW5ub3QgYmUgZ3VhcmFudGVl
ZCB0byBiZSBzZWN1cmUgb3IgZXJyb3IgZnJlZSBhcyB0aGV5IGNhbiBiZSBpbnRlcmNlcHRlZCwg
YW1lbmRlZCwgbG9zdCBvciBkZXN0cm95ZWQsIGFuZCB5b3Ugc2hvdWxkIHRha2UgZnVsbCByZXNw
b25zaWJpbGl0eSBmb3Igc2VjdXJpdHkgY2hlY2tpbmcuIAogCuacrOmCruS7tuWPiuWFtuS7u+S9
lemZhOS7tuWFt+acieS/neWvhuaAp+i0qO+8jOW5tuWPr+iDveWPl+WFtuS7luS/neaKpOaIluS4
jeWFgeiuuOiiq+aKq+mcsue7meesrOS4ieaWueOAguWmgumYgeS4i+ivr+aUtuWIsOacrOmCruS7
tu+8jOaVrOivt+eri+WNs+S7peWbnuWkjeeUteWtkOmCruS7tueahOaWueW8j+mAmuefpeWPkeS7
tuS6uu+8jOW5tuWwhuacrOmCruS7tuWPiuWFtuS7u+S9lemZhOS7tuS7jumYgeS4i+ezu+e7n+S4
reS6iOS7peWIoOmZpOOAguWmgumYgeS4i+W5tumdnuacrOmCruS7tuWGmeaYjuS5i+aUtuS7tuS6
uu+8jOaVrOivt+WIh+WLv+S9v+eUqOOAgeWkjeWItuOAgeaKq+mcsuacrOmCruS7tuaIluWFtuS7
u+S9leWGheWuue+8jOS6puivt+WIh+WLv+S+neacrOmCruS7tuaIluWFtuS7u+S9leWGheWuueiA
jOmHh+WPluS7u+S9leihjOWKqOOAgueUteWtkOmCruS7tuaXoOazleS/neivgeaYr+S4gOenjeWu
ieWFqOWSjOS4jeS8muWHuueOsOS7u+S9leW3rumUmeeahOmAmuS/oeaWueW8j++8jOWPr+iDveS8
muiiq+aLpuaIquOAgeS/ruaUueOAgeS4ouWkseaIluaNn+Wdj++8jOaUtuS7tuS6uumcgOiHquih
jOi0n+i0o+WBmuWlveWuieWFqOajgOafpeOAgg==
