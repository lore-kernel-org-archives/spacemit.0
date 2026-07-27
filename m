Received: from va-2-52.ptr.blmpb.com (va-2-52.ptr.blmpb.com [209.127.231.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A2C17DFE7
	for <spacemit@lists.linux.dev>; Mon, 27 Jul 2026 01:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785115406; cv=none; b=P7oa9ymFvSBFGESujZuUXc216q0e6t8CzvJA50rbdb8wdOCQt+oLWIqDpS/KaeWNBUThsxqOoL7yC1P7Rhd72U87LPqCufhRy3Nl9+3/1hwroLAhH+rfOaYnOMzGB+zrnacstDVN0KIJChxR20T6pe9B6vHE6JLdf9ByVp8mfcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785115406; c=relaxed/simple;
	bh=XV0NrFORnIdnr/PNORqkOdVPEPoYU67EI/Onxbvi/LE=;
	h=From:Subject:Date:Mime-Version:In-Reply-To:References:To:Cc:
	 Message-Id:Content-Type; b=mVQyWYfQMDtfhnN6IcCd2hm1AgEYhosNzFFiXwe/7CJmtSsRCVlvaY0gO9msZLBI2yWmOFIrgROqoZoDawCR9kdJEVL7sR7c7QYxw/EIQ4E+RAxx/gEGkG3cvqNXvVKpKH7hmqATI/3SuKv5W+1f8HNRzepihBkrq7y5LVhJAZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacemit.com; spf=pass smtp.mailfrom=spacemit.com; dkim=pass (2048-bit key) header.d=spacemit.com header.i=@spacemit.com header.b=pXAkob8+; arc=none smtp.client-ip=209.127.231.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spacemit.com header.i=@spacemit.com header.b="pXAkob8+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1785115391; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=XV0NrFORnIdnr/PNORqkOdVPEPoYU67EI/Onxbvi/LE=;
 b=pXAkob8+nM8o4WVFnfPlQ2AjqyBGTMiuVzlGM0c63WiPL0i2ectomMj2UxxzBroARgYmTS
 TX2NvOcnI4l5WvIw9Ttpp9nF/TACn3uutHeF+K7jUa6dbI2GoVNWswm0sURFz/ePo/iCqh
 R5q3/4hDf8CTZSYYsP9yJpH0HHcG728x+7pxvvGo7jaxa6l2+qk750UVcURfqY5XysUG8q
 xBidSwdeHQzOtSCZj4E56S5W3+3638KYCsT1BlEw05gQnF9+Y8LK0BiQUjh2f0xtH/1MYS
 G5O89/x+CI1+TldRXDiltxfa/g09LQonlyZZWMK4i6Jt5Kokpj3nGroU5iAleA==
From: "Sterling-Ash" <baihui.liang@spacemit.com>
Subject: [PATCH v2 0/2] drm/imagination: support GPU probe without power-domains
Date: Mon, 27 Jul 2026 09:22:29 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a66b2fe+f50a20+lists.linux.dev+baihui.liang@spacemit.com>
In-Reply-To: <75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com>
References: <75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com>
Content-Transfer-Encoding: base64
To: "Frank Binns" <frank.binns@imgtec.com>, 
	"Matt Coster" <matt.coster@imgtec.com>
X-Original-From: Sterling-Ash <baihui.liang@spacemit.com>
Received: from snode5.. ([120.237.158.181]) by smtp.feishu.cn with ESMTP; Mon, 27 Jul 2026 09:23:09 +0800
Cc: "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, 
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>
Message-Id: <20260727012231.1025210-1-baihui.liang@spacemit.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8

VGhpcyB2MiByZW9yZGVycyBhbmQgZXh0ZW5kcyB0aGUgZWFybGllciBzdGFuZGFsb25lIHB2cl9w
b3dlci5jIGNoYW5nZQ0KcGVyIEFsZXNzaW8ncyByZXZpZXcgWzFdLg0KDQpPbiB0aGUgU3BhY2Vt
aVQgSzMgU29DLCB0aGUgR1BVIHBvd2VyIGRvbWFpbiBpcyBlbmFibGVkIG9uY2UgYnkgdGhlIGJv
b3Rsb2FkZXINCmJlZm9yZSBMaW51eCBib290cyBhbmQgaXMgbmVpdGhlciBtb2RlbGxlZCBub3Ig
c3dpdGNoZWQgYnkgTGludXggYXQgcnVudGltZS4NCg0KQXMgcG9pbnRlZCBvdXQgaW4gcmV2aWV3
LCBpbWcscG93ZXJ2ci1yb2d1ZS55YW1sIGN1cnJlbnRseSBoYXMgbm8NCmNvbXBhdGlibGUgZW50
cnkgdGhpcyBwbGF0Zm9ybSdzIEdQVSBjYW4gdXNlLCBzbyBwYXRjaCAxIGFkZHMgb25lDQooc3Bh
Y2VtaXQsazMtZ3B1ICsgaW1nLGltZy1ieG0tNC02NCArIGltZyxpbWctcm9ndWUpIGFzIGl0cyBv
d24gb25lT2YNCmVudHJ5LCBkaXN0aW5jdCBmcm9tIHRoZWFkLHRoMTUyMC1ncHUgc2luY2UgdGhl
IHR3byBkaWZmZXIgaW4gY2xvY2sNCnJlcXVpcmVtZW50cy4gVGhpcyBuZXcgY29tcGF0aWJsZSBk
b2Vzbid0IG1hdGNoIGFueSBvZiB0aGUgc2NoZW1hJ3MNCmV4aXN0aW5nIHBlci1jb21wYXRpYmxl
ICJpZiIgYmxvY2tzLCBzbyBwb3dlci1kb21haW5zIGZhbGxzIGJhY2sgdG8NCnRoZSBzY2hlbWEn
cyBkZWZhdWx0IChvcHRpb25hbCkgYmVoYXZpb3VyIGZvciBpdCAtLSBubyBhZGRpdGlvbmFsDQpy
ZXF1aXJlZC9mYWxzZSBvdmVycmlkZSBpcyBuZWVkZWQuDQoNClBhdGNoIDIgaXMgdGhlIHByZXZp
b3VzbHktc2VudCBkcml2ZXIgY2hhbmdlOiBwdnJfcG93ZXJfZG9tYWluc19pbml0KCkNCnRyZWF0
cyBhIG1pc3NpbmcgInBvd2VyLWRvbWFpbnMiIHByb3BlcnR5IGFzICJub3RoaW5nIHRvIGF0dGFj
aCIgaW5zdGVhZCBvZiBmYWlsaW5nDQpwcm9iZSB3aXRoIC1FTk9FTlQuDQoNClsxXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvNzVjOTM4MmQyYmRhNzY2YWE0NTliMDAzMjExNTNkNzE1MjU0
ZDFhNC5jYW1lbEBpbWd0ZWMuY29tLw0KDQpTdGVybGluZy1Bc2ggKDIpOg0KICBkdC1iaW5kaW5n
czogZ3B1OiBpbWcscG93ZXJ2ci1yb2d1ZTogYWRkIHNwYWNlbWl0LGszLWdwdQ0KICBkcm0vaW1h
Z2luYXRpb246IGFsbG93IHByb2JlIHdoZW4gbm8gcG93ZXItZG9tYWlucyBhcmUgZGVzY3JpYmVk
DQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbCAg
ICAgICB8IDUgKysrKysNCiBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3Bvd2VyLmMg
ICAgICAgICAgICAgICAgICB8IDkgKysrKysrKysrDQogMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspDQoNCi0tIA0KMi4zNC4xDQoKVGhpcyBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVu
dCBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYmUgcHJpdmlsZWdlZCBvciBvdGhlcndpc2UgcHJv
dGVjdGVkIGZyb20gZGlzY2xvc3VyZS4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBp
ZW50IG9mIHRoaXMgbWVzc2FnZSwgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgYW55IGF0dGFjaG1lbnQg
ZnJvbSB5b3VyIHN5c3RlbSBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYnkgcmVw
bHkgZS1tYWlsLiBVbmludGVuZGVkIHJlY2lwaWVudHMgc2hvdWxkIG5vdCB1c2UsIGNvcHksIGRp
c2Nsb3NlIG9yIHRha2UgYW55IGFjdGlvbiBiYXNlZCBvbiB0aGlzIG1lc3NhZ2Ugb3IgYW55IGlu
Zm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UuIEVtYWlscyBjYW5ub3QgYmUgZ3Vh
cmFudGVlZCB0byBiZSBzZWN1cmUgb3IgZXJyb3IgZnJlZSBhcyB0aGV5IGNhbiBiZSBpbnRlcmNl
cHRlZCwgYW1lbmRlZCwgbG9zdCBvciBkZXN0cm95ZWQsIGFuZCB5b3Ugc2hvdWxkIHRha2UgZnVs
bCByZXNwb25zaWJpbGl0eSBmb3Igc2VjdXJpdHkgY2hlY2tpbmcuIAogCuacrOmCruS7tuWPiuWF
tuS7u+S9lemZhOS7tuWFt+acieS/neWvhuaAp+i0qO+8jOW5tuWPr+iDveWPl+WFtuS7luS/neaK
pOaIluS4jeWFgeiuuOiiq+aKq+mcsue7meesrOS4ieaWueOAguWmgumYgeS4i+ivr+aUtuWIsOac
rOmCruS7tu+8jOaVrOivt+eri+WNs+S7peWbnuWkjeeUteWtkOmCruS7tueahOaWueW8j+mAmuef
peWPkeS7tuS6uu+8jOW5tuWwhuacrOmCruS7tuWPiuWFtuS7u+S9lemZhOS7tuS7jumYgeS4i+ez
u+e7n+S4reS6iOS7peWIoOmZpOOAguWmgumYgeS4i+W5tumdnuacrOmCruS7tuWGmeaYjuS5i+aU
tuS7tuS6uu+8jOaVrOivt+WIh+WLv+S9v+eUqOOAgeWkjeWItuOAgeaKq+mcsuacrOmCruS7tuaI
luWFtuS7u+S9leWGheWuue+8jOS6puivt+WIh+WLv+S+neacrOmCruS7tuaIluWFtuS7u+S9leWG
heWuueiAjOmHh+WPluS7u+S9leihjOWKqOOAgueUteWtkOmCruS7tuaXoOazleS/neivgeaYr+S4
gOenjeWuieWFqOWSjOS4jeS8muWHuueOsOS7u+S9leW3rumUmeeahOmAmuS/oeaWueW8j++8jOWP
r+iDveS8muiiq+aLpuaIquOAgeS/ruaUueOAgeS4ouWkseaIluaNn+Wdj++8jOaUtuS7tuS6uumc
gOiHquihjOi0n+i0o+WBmuWlveWuieWFqOajgOafpeOAgg==
